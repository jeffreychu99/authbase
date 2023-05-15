# coding:utf-8
import imp
from operator import or_

from app.models.Organization import Organization
from ..base import base
from ..models import Role, Resource, User
from flask import render_template, request
from flask_login import current_user
from flask import jsonify
from datetime import datetime
from .. import  db
import uuid
from sqlalchemy import desc
from sqlalchemy import asc
from sqlalchemy import or_

@base.route('/base/syrole!doNotNeedSecurity_getRolesTree.action', methods=['POST'])
def get_roles_tree():
    roles = Role.query.join(User, Role.users).filter(User.ID == current_user.ID).all()
    return jsonify([role.to_json() for role in roles])

@base.route('/base/syrole!doNotNeedSecurity_getRoleByUserId.action', methods=['POST'])
def get_roles_by_userId():
    roles = Role.query.join(User, Role.users).filter(User.ID == request.form.get('id')).all()
    return jsonify([role.to_json() for role in roles])


@base.route('/system/role/authUser/cancelAll', methods=['PUT'])
def cancel_all_role():
    roleId = request.args.get('roleId')
    userIds = request.args.get('userIds')

    #role = Role.query.get(roleId)
    idList = userIds.split(',')
    #toCancelUsers = [User.query.get(uid) for uid in idList]
    #role.users = [user2  for user2 in role.users.all() for user in toCancelUsers if user2.ID != user.ID ]
    for userId in idList:
        user = User.query.get(userId)
        user.roles = [role for role in user.roles.all() if role.ID != roleId]
        db.session.add(user)

    return jsonify({'code': 200, 'msg': '取消成功'})

@base.route('/system/role/authUser/cancel', methods=['PUT'])
def cancel_role():
    roleId = request.json.get('roleId')
    userId = request.json.get('userId')

    user = User.query.get(userId)
    user.roles = [role for role in user.roles.all() if role.ID != roleId]
    db.session.add(user)

    return jsonify({'code': 200, 'msg': '取消成功'})

@base.route('/system/role/list', methods=['GET'])
def grid():
    filters = []
    if request.args.get('roleName'):
        filters.append(Role.NAME.like('%' + request.args.get('roleName') + '%'))

    order_by = []
    if request.form.get('sort'):
        if request.form.get('order') == 'asc':
            order_by.append(asc(getattr(Role,request.form.get('sort').upper())))
        elif request.form.get('order') == 'desc':
            order_by.append(desc(getattr(Role,request.form.get('sort').upper())))
        else:
            order_by.append(getattr(Role,request.form.get('sort').upper()))

    page = request.args.get('pageNum', 1, type=int)
    rows = request.args.get('pageSize', 10, type=int)
    pagination = current_user.roles.filter(*filters).order_by(*order_by).paginate(
        page=page, per_page=rows, error_out=False)
    roles = pagination.items

    return jsonify({'rows': [role.to_json() for role in roles], 'total': pagination.total})

@base.route('/system/role/<string:id>', methods=['GET'])
def syrole_getById(id):
    role = Role.query.get(id)

    if role:
        return jsonify({'code': 200, 'msg': '操作成功', 'data': role.to_json()})
    else:
        return jsonify({'success': False, 'msg': 'error'})

@base.route('/system/role', methods=['PUT'])
def syrole_update():
    role = Role.query.get(request.json['roleId'])

    role.UPDATEDATETIME = datetime.now()
    role.NAME = request.json['roleName']
    role.DESCRIPTION = request.json['remark']
    role.SEQ = request.json['roleSort']
    if 'roleKey' in request.json: role.ROLEKEY = request.json['roleKey']
    if 'dataScope' in request.json: role.DATASCOPE = request.json['dataScope']

    if 'menuIds' in request.json:
        res_list = [Resource.query.get(menuId) for menuId in request.json['menuIds']]
        role.resources = res_list

    db.session.add(role)

    return jsonify({'code': 200, 'msg': '操作成功'})

@base.route('/system/role', methods=['POST'])
def syrole_save():
    role = Role()

    role.ID = str(uuid.uuid4())
    role.NAME = request.json['roleName']
    if 'roleKey' in request.json: role.ROLEKEY = request.json['roleKey']
    if 'remark' in request.json: role.DESCRIPTION = request.json['remark']
    role.SEQ = request.json['roleSort']
    if 'dataScope' in request.json: role.DATASCOPE = request.json['dataScope']

    if 'menuIds' in request.json:
        res_list = [Resource.query.get(menuId) for menuId in request.json['menuIds']]
        role.resources = res_list
        
    # add current use to new role
    current_user.roles.append(role)

    db.session.add(role)

    return jsonify({'code': 200, 'msg': '操作成功'})

@base.route('/system/role/<string:id>', methods=['DELETE'])
def syrole_delete(id):
    role = Role.query.get(id)
    if role:
        db.session.delete(role)

    return jsonify({'code': 200, 'msg': '操作成功'})

@base.route('/system/role/authUser/allocatedList', methods=['GET'])
def allocatedList():
    page = request.args.get('pageNum', 1, type=int)
    rows = request.args.get('pageSize', 10, type=int)
    pagination = User.query.join(Role, User.roles).filter(Role.ID == request.args['roleId']).paginate(
        page=page, per_page=rows, error_out=False)
    users = pagination.items

    return jsonify({'rows': [user.to_json() for user in users], 'total': pagination.total})

@base.route('/system/role/authUser/unallocatedList', methods=['GET'])
def unallocatedList():
    page = request.args.get('pageNum', 1, type=int)
    rows = request.args.get('pageNum', 10, type=int)
    pagination = User.query.join(Role, User.roles).filter(or_(Role.ID != request.args['roleId'], Role.ID == None)).paginate(
        page=page, per_page=rows, error_out=False)
    users = pagination.items

    return jsonify({'rows': [user.to_json() for user in users], 'total': pagination.total})


@base.route('/system/dept/roleDeptTreeselect/<id>', methods=['GET'])
def roleDeptTreeselect(id):
    role = Role.query.get(id)
    dept = Organization.query.get('0')

    return jsonify({'code': 200, 'msg': '操作成功', 'checkedKeys': [dept.ID for dept in role.depts], \
         'depts': [dept.to_tree_select_json()]})

@base.route('/system/role/dataScope', methods=['PUT'])
def syrole_dataScope():
    role = Role.query.get(request.json['roleId'])

    if 'dataScope' in request.json: role.DATASCOPE = request.json['dataScope']
    if 'deptIds' in request.json:
        dept_list = [Organization.query.get(deptId) for deptId in request.json['deptIds']]
        role.depts = dept_list
    
    db.session.add(role)

    return jsonify({'code': 200, 'msg': '操作成功'})

@base.route('/system/role/authUser/selectAll', methods=['PUT'])
def syrole_authUser_selectAll():
    role = Role.query.get(request.args.get('roleId'))
    userIds = request.args.get('userIds')

    idList = userIds.split(',')
    for userId in idList:
        user = User.query.get(userId)
        user.roles.append(role)
        db.session.add(user)

    return jsonify({'code': 200, 'msg': '操作成功'})