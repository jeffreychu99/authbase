from ..base import base
from ..models import Resource, Organization
from ..models import Role
from ..models import User
from flask import g, jsonify
from flask_login import current_user
import json
from ..models import ResourceType
from flask import render_template, request
from .. import  db
import uuid
from datetime import datetime
from sqlalchemy import desc
from sqlalchemy import asc
from flask_login import login_required

@base.route('/base/syresource!doNotNeedSecurity_getMainMenu.action', methods=['POST'])
@login_required
def resource_grid():
    rs = Resource.query.join(Role, Resource.roles).join(User, Role.users).filter(User.ID == current_user.ID).all()

    return jsonify([r.to_menu_json() for r in rs])


@base.route('/base/syresourcetype!doNotNeedSecurity_combobox.action', methods=['POST'])
@login_required
def resource_type_combox():
    rt = ResourceType.query.all()
    return jsonify([r.to_json() for r in rt])

@base.route('/base/syresource!doNotNeedSecurity_getRoleResources.action', methods=['POST'])
@login_required
def get_role_resources():
    resources = Resource.query.join(Role, Resource.roles).filter(Role.ID == request.form.get('id')).all()
    return jsonify([res.to_json() for res in resources])

@base.route('/base/syresource!doNotNeedSecurity_getResourcesTree.action', methods=['POST'])
@login_required
def get_resources_tree():
    return syresource_treeGrid()

@base.route('/base/syresource!doNotNeedSecurity_getOrganizationResources.action', methods=['POST'])
@login_required
def get_organization_resources():
    resources = Resource.query.join(Organization, Resource.organizations).filter(Organization.ID == request.form.get('id')).all()
    return jsonify([res.to_json() for res in resources])    

@base.route('/system/menu/list', methods=['GET'])
@login_required
def syresource_treeGrid():
    filters = []
    if 'menuName' in request.args:
        filters.append(Resource.NAME.like('%' + request.args['menuName'] + '%'))

    order_by = []
    order_by.append(asc(getattr(Resource, 'SYRESOURCE_ID')))
    order_by.append(asc(getattr(Resource, 'SEQ')))

    res_list = Resource.query.filter(*filters).order_by(*order_by)

    return jsonify({"msg":"操作成功","code":200, "data": [org.to_json() for org in res_list]})

@base.route('/base/syresource!doNotNeedSecurity_comboTree.action', methods=['POST'])
@login_required
def syresource_comboTree():
    res_list = Resource.query.all()

    return jsonify([org.to_json() for org in res_list])

@base.route('/system/menu/<id>', methods=['GET'])
@login_required
def syresource_getById(id):
    res = Resource.query.get(id)

    if res:
        return jsonify({'code': 200, 'msg': '操作成功', 'data': res.to_json()})
    else:
        return jsonify({'success': False, 'msg': 'error'})

@base.route('/system/menu', methods=['PUT'])
@login_required
def syresource_update():
    res = Resource.query.get(request.json['menuId'])

    res.UPDATEDATETIME = datetime.now()
    if 'icon' in request.json: res.ICONCLS = request.json['icon']
    if 'component' in request.json: res.URL = request.json['component']
    if 'path' in request.json: res.PATH = request.json['path']
    if 'menuName' in request.json: res.NAME = request.json['menuName']
    if 'orderNum' in request.json: res.SEQ = request.json['orderNum']
    if 'perms' in request.json: res.PERMS = request.json['perms']
    if 'menuType' in request.json: res.SYRESOURCETYPE_ID = '1' if request.json['menuType'] == 'F' else '0' if request.json['menuType'] == 'C' else '3'
    if 'parentId' in request.json: res.parent = Resource.query.get(request.json['parentId'])
    if 'status' in request.json: res.STATUS = request.json['status']

    db.session.add(res)

    return jsonify({'code': 200, 'msg': '操作成功'})

@base.route('/system/menu', methods=['POST'])
@login_required
def syresource_save():
    res = Resource()

    res.ID = str(uuid.uuid4())
    if 'icon' in request.json: res.ICONCLS = request.json['icon']
    if 'component' in request.json: res.URL = request.json['component']
    if 'path' in request.json: res.PATH = request.json['path']
    if 'menuName' in request.json: res.NAME = request.json['menuName']
    if 'orderNum' in request.json: res.SEQ = request.json['orderNum']
    if 'perms' in request.json: res.PERMS = request.json['perms']
    if 'menuType' in request.json: res.SYRESOURCETYPE_ID = '1' if request.json['menuType'] == 'F' else '0' if request.json['menuType'] == 'F' else '3'
    if 'parentId' in request.json: res.parent = Resource.query.get(request.json['parentId'])
    if 'status' in request.json: res.STATUS = request.json['status']

    db.session.add(res)

    return jsonify({'code': 200, 'msg': '操作成功'})

@base.route('/system/menu/<id>', methods=['DELETE'])
@login_required
def syresource_delete(id):
    res = Resource.query.get(id)
    if res:
        db.session.delete(res)

    return jsonify({'code': 200, 'msg': '操作成功'})

@base.route('/system/menu/treeselect', methods=['GET'])
@login_required
def syresource_tree_select():
    resList = Resource.query.filter(Resource.SYRESOURCE_ID == None)

    return jsonify({'msg': '操作成功', 'code': 200, "data": [res.to_tree_select_json() for res in resList]})

@base.route('/system/menu/roleMenuTreeselect/<roleId>', methods=['GET'])
@login_required
def syresource_role_tree_select(roleId):
    role = Role.query.get(roleId)
    resList = Resource.query.filter(Resource.SYRESOURCE_ID == None)

    return jsonify({'msg': '操作成功', 'code': 200, \
        "menus": [res.to_tree_select_json() for res in resList], \
        "checkedKeys": [res.ID for res in role.resources]}) 

