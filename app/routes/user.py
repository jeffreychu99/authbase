# coding:utf-8
from ..base import base
from ..models import User, Organization, Role, OnLine
from flask import render_template, request
from flask import g, jsonify
import hashlib
from flask_login import login_user, logout_user, login_required, \
    current_user
from datetime import datetime
from .. import  db
import uuid
from sqlalchemy import asc, true
from sqlalchemy import desc
from sqlalchemy import text
import flask_excel as excel
from .. import permission
from ..operationlog import log_operation
import os
from .. import captcha
from flask import send_from_directory
from werkzeug.utils import secure_filename

@base.route('/system/user/authRole', methods=['PUT'])
@login_required
@permission('system:role:edit')
def grant_user_role():
    id = request.args['userId']
    ids = request.args['roleIds']

    user = User.query.get(id)

    if not ids:
        user.roles = []
    else:
        idList = ids.split(',')
        user.roles = [Role.query.get(rid) for rid in idList]

    db.session.add(user)

    return jsonify({'code': 200, 'msg': '操作成功'})

@login_required
def record_login_history(type):
    online = OnLine()
    online.ID = str(uuid.uuid4())
    online.LOGINNAME = current_user.LOGINNAME
    online.IP = request.remote_addr
    online.TYPE = type
    db.session.add(online)

@base.route('/logout', methods=['POST'])
@login_required
def do_logout():
    record_login_history(0)
    logout_user()
    return jsonify({'success': True})

@base.route('/login', methods=['POST'])
def do_login():
    if not captcha.verify(request.json['code'], request.json['uuid']):
        return jsonify({'msg': '验证码错误~', 'code': 400})

    #检查用户名是否存在
    user = User.query.filter_by(LOGINNAME=request.json['username']).first()
    
    if user is not None:
        if user.STATUS != '0':
            return jsonify({'msg': '登录失败,账号未激活~请联系管理员', 'code': 400})
        salt = bytes.fromhex(user.SALT)
        hash = hash_password(request.json['password'], salt).hex()
        #MD5加密后的内容同数据库密码比较
        if hash == user.PWD:
            login_user(user)
            record_login_history(1)
            return jsonify({'msg': '登录成功~', 'code': 200, 'url': '/', 'token': str(uuid.uuid4())})
    return jsonify({'msg': '登录失败,账号密码错误~', 'code': 500})

@base.route('/system/user/list', methods=['GET'])
@login_required
@permission('system:user:list')
def user_grid():
    filters = []
    if 'userName' in request.args:
        filters.append(User.LOGINNAME.like('%' + request.args['userName'] + '%'))
    if 'phonenumber' in request.args:
        filters.append(User.PHONENUMBER.like('%' + request.args['phonenumber'] + '%'))
    if 'params[beginTime]' in request.args and 'params[endTime]' in request.args:
        filters.append(User.CREATEDATETIME >  request.args['params[beginTime]'])
        filters.append(User.CREATEDATETIME <  request.args['params[endTime]'])

    order_by = []
    if request.form.get('sort'):
        if request.form.get('order') == 'asc':
            order_by.append(asc(getattr(User,request.form.get('sort').upper())))
        elif request.form.get('order') == 'desc':
            order_by.append(desc(getattr(User,request.form.get('sort').upper())))
        else:
            order_by.append(getattr(User,request.form.get('sort').upper()))

    page = request.args.get('pageNum', 1, type=int)
    rows = request.args.get('pageSize', 10, type=int)
    if 'deptId' in request.args:
        # Define a recursive CTE
        dept_cte = (
            db.session.query(Organization.ID)
            .filter(Organization.ID == request.args['deptId'])
            .cte('dept_tree', recursive=True)
        )
        
        # Recursive part of the CTE
        dept_cte = dept_cte.union_all(
            db.session.query(Organization.ID)
            .join(dept_cte, Organization.SYORGANIZATION_ID == dept_cte.c.ID)
        )
        pagination = User.query.join(Organization, User.organizations).join(
            dept_cte, Organization.ID == dept_cte.c.ID).filter(*filters).params(
            dept_id=request.args['deptId']).order_by(*order_by).paginate(
            page=page, per_page=rows, error_out=False)
    else:
        pagination = User.query.filter(*filters).order_by(*order_by).paginate(
            page=page, per_page=rows, error_out=False)
    users = pagination.items

    return jsonify({'rows': [user.to_json() for user in users], 'total': pagination.total, 'code': 200, 'msg': '查询成功'})

@base.route('/system/user/', methods=['GET'])
@login_required
def syuser_get():
    json = {'code': 200, 'msg': ''}
    json['roles'] = [role.to_json() for role in Role.query.all()]
    json['posts'] = []
    return jsonify(json)

@base.route('/system/user/<id>', methods=['GET'])
@login_required
@permission('system:user:query')
def syuser_getById(id):
    user = User.query.get(id)

    if user:
        json = {'code': 200, 'msg': '', 'data': user.to_json()}
        if len(user.roles.all()) > 0:
            json['roles'] = [role.to_json() for role in user.roles]
            json['roleIds'] = [role.ID for role in user.roles]

        return jsonify(json)
    else:
        return jsonify({'success': False, 'msg': 'error'})

@base.route('/system/user', methods=['PUT'])
@login_required
@permission('system:user:edit')
def syuser_update():
    id = request.json['userId']
    userName = request.json['userName']
    
    # if User.query.filter(User.LOGINNAME == loginname).filter(User.ID != id).first():
    #     return jsonify({'code': 201, 'msg': '更新用户失败，用户名已存在！'})

    user = User.query.get(id)

    user.UPDATEDATETIME = datetime.now()
    if 'nickName' in request.json: user.NAME = request.json['nickName'] 
    if 'sex' in request.json: user.SEX = request.json['sex']
    if 'email' in request.json: user.EMAIL = request.json['email']
    if 'phonenumber' in request.json: user.PHONENUMBER = request.json['phonenumber']
    if 'deptId' in request.json: user.organizations = Organization.query.filter(Organization.ID == request.json['deptId']).all()
    if 'roleIds' in request.json:
        user.roles = [Role.query.get(roleId) for roleId in request.json['roleIds']]

    db.session.add(user)

    return jsonify({'code': 200, 'msg': '更新成功！'})

def generate_salt(length=16):
    """生成随机盐"""
    return os.urandom(length)

def hash_password(password, salt):
    """使用PBKDF2算法加密密码"""
    return hashlib.pbkdf2_hmac('sha512', password.encode('utf-8'), salt, 100000)

@base.route('/system/user', methods=['POST'])
@login_required
@permission('system:user:add')
def syuser_save():
    if User.query.filter_by(LOGINNAME = request.json['userName']).first():
        return jsonify({'success': False, 'msg': '新建用户失败，用户名已存在！'})

    user = User()

    user.ID = str(uuid.uuid4())
    salt = generate_salt()
    user.SALT = salt.hex()
    user.PWD = hash_password(request.json['password'], salt).hex()

    with db.session.no_autoflush:
        if 'nickName' in request.json: user.NAME = request.json['nickName'] 
        if 'sex' in request.json: user.SEX = request.json['sex']
        if 'email' in request.json: user.EMAIL = request.json['email']
        if 'phonenumber' in request.json: user.PHONENUMBER = request.json['phonenumber']
        if 'deptId' in request.json: user.organizations = Organization.query.filter(Organization.ID == request.json['deptId']).all()
        if 'roleIds' in request.json:
            user.roles = [Role.query.get(roleId) for roleId in request.json['roleIds']]

        user.LOGINNAME = request.json['userName']

        # add current use to new user
        #current_user.roles.append(user)

        db.session.add(user)

    return jsonify({'code': 200, 'msg': '新建用户成功！'})

@base.route('/system/user/<id>', methods=['DELETE'])
@login_required
@permission('system:user:remove')
def syuser_delete(id):
    user = User.query.get(id)
    if user:
        db.session.delete(user)

    return jsonify({'code': 200, 'msg': '删除成功'})

@base.route('/system/user/profile/updatePwd', methods=['PUT']) 
@login_required
@log_operation('修改密码')
def syuser_update_pwd():
    user = User.query.get(current_user.ID)

    if user:
        salt = bytes.fromhex(user.SALT)
        hash = hash_password(request.args.get('oldPassword'), salt).hex()
        if hash != user.PWD:
            return jsonify({'code': 400, 'msg': '旧密码错误'})

        user.PWD = hash_password(request.args.get('newPassword'), salt).hex()
        db.session.add(user)
    return jsonify({'code': 200, 'msg': '修改成功'})

@base.route('/getInfo', methods=['GET'])
@login_required
def syuser_info():
    resources = []
    resourceTree = []

    resources += [res for org in current_user.organizations for res in org.resources if org.resources]
    resources += [res for role in current_user.roles for res in role.resources if role.resources]
    
    # remove repeat
    new_dict = dict()
    for obj in resources:
        if obj.ID not in new_dict:
            new_dict[obj.ID] = obj

    for resource in new_dict.values():
        resourceTree.append(resource.PERMS)

    return jsonify({'msg': '登录成功~', 'code': 200, \
        'user': {'userName': current_user.LOGINNAME, 'avatar': '', 'nickName': current_user.NAME, 'userId': current_user.ID}, \
        'roles': [role.NAME for role in current_user.roles], 'permissions': resourceTree})

@base.route('/system/user/profile', methods=['GET'])
@login_required
def syuser_profile():
     return jsonify({'msg': '操作成功', 'code': 200, \
        'data': current_user.to_json(), \
        'postGroup': current_user.organizations[0].NAME if len(current_user.organizations) > 0 else '', \
        'roleGroup': [role.NAME for role in current_user.roles]})

@base.route('/system/user/profile', methods=['PUT'])
@login_required
def syuser_update_profile():
    id = request.json['userId']
    userName = request.json['userName']
    user = User.query.get(id)

    user.UPDATEDATETIME = datetime.now()
    if 'nickName' in request.json: user.NAME = request.json['nickName'] 
    if 'sex' in request.json: user.SEX = request.json['sex']
    if 'email' in request.json: user.EMAIL = request.json['email']
    if 'phonenumber' in request.json: user.PHONENUMBER = request.json['phonenumber']

    db.session.add(user)

    return jsonify({'code': 200, 'msg': '更新成功！'})

@base.route('/system/user/authRole/<id>', methods=['GET'])
@login_required
def syuser_auth_role(id):
    user = User.query.get(id)
    userRoles = [role for role in user.roles]
    allRoles = Role.query.all()
    for allRole in allRoles:
        for userRole in userRoles:
            if userRole.ID == allRole.ID:
                allRole.flag = True

    return jsonify({'code': 200, 'msg': '操作成功', 'roles': [role.to_json() for role in allRoles], 'user': user.to_json()})

@base.route('/base/syuser/export', methods=['POST'])
@login_required
def user_export():
    rows = []
    rows.append(['登录名', '姓名', '创建时间', '修改时间', '性别'])

    users = User.query.all()
    for user in users:
        row = []
        row.append(user.LOGINNAME)
        row.append(user.NAME)
        row.append(user.CREATEDATETIME)
        row.append(user.UPDATEDATETIME)
        if user.SEX == '0':
            row.append('女')
        elif user.SEX == '1':
            row.append('男')
        rows.append(row)

    return excel.make_response_from_array(rows, "csv",
                                          file_name="user")


@base.route('/system/user/changeStatus', methods=['PUT'])
@login_required
@permission('system:user:edit')
def syuser_status_update():
    user = User.query.get(request.json['userId'])

    if 'status' in request.json: user.STATUS = request.json['status']

    db.session.add(user)

    return jsonify({'code': 200, 'msg': '操作成功'})

@base.route('/system/user/profile/avatar', methods=['POST'])
def syuser_avatar_update():
    file = request.files['avatarfile']
    filename = str(uuid.uuid4()) + ".jpg"
    file.save(os.path.join(get_upload_path(), filename))

    current_user.PHOTO = '/system/user/profile/avatar/' + filename
    db.session.add(current_user)
    db.session.commit()

    return jsonify({'msg': '操作成功', 'code': 200, 'imgUrl':  current_user.PHOTO})

@base.route('/system/user/profile/avatar/<filename>', methods=['GET'])
def sysuser_avatar_preview(filename):
    try:
        filename = secure_filename(filename)
        response = send_from_directory(get_upload_path(), filename, as_attachment=False)
            # 根据文件扩展名设置 MIME 类型
        if filename.endswith('.jpg') or filename.endswith('.jpeg'):
            response.headers['Content-Type'] = 'image/jpeg'
        elif filename.endswith('.png'):
            response.headers['Content-Type'] = 'image/png'
        return response
    except FileNotFoundError: 
        return jsonify({'msg': '文件不存在', 'code': 404})   

def get_upload_path():
    parent = os.path.dirname(os.path.abspath(__file__))
    parent = os.path.dirname(parent)
    parent = os.path.dirname(parent)

    path = os.path.join(parent, "uploads")
    if not os.path.exists(path):
        os.makedirs(path)
    return path
