from ..base import base
from ..models import Resource
from ..models import Role
from ..models import User
from ..models import Organization
from flask import g, jsonify, request
from flask_login import current_user, login_required
import json
from .. import db
from flask import render_template
from datetime import datetime
import uuid

@base.route('/base/syorganization!grant.action', methods=['POST'])
def grant_organization_resource():
    id = request.form.get('id')
    ids = request.form.get('ids')

    org = Organization.query.get(id)

    if not ids:
        org.resources = []
    else:
        idList = ids.split(',')
        org.resources = [Resource.query.get(rid) for rid in idList]

    db.session.add(org)

    return jsonify({'success': True})    

@base.route('/system/dept/list', methods=['GET'])
@login_required
def syorganization_treeGrid():
    filters = []
    if 'deptName' in request.args:
        filters.append(Organization.NAME.like('%' + request.args['deptName'] + '%'))

    orgs = Organization.query.filter(*filters)

    return jsonify({'msg': '操作成功', 'code': 200, "data": [org.to_json() for org in orgs]})

@base.route('/system/dept/treeselect', methods=['GET'])
@login_required
def syorganization_tree_select():
    orgs = Organization.query.filter(Organization.SYORGANIZATION_ID == None)

    return jsonify({'msg': '操作成功', 'code': 200, "data": [org.to_tree_select_json() for org in orgs]}) 

@base.route('/system/dept/list/exclude/<id>', methods=['GET'])
@login_required
def syorganization_dept_list_exclude(id):
    orgs = Organization.query.filter(Organization.ID != id)

    return jsonify({'msg': '操作成功', 'code': 200, "data": [org.to_json() for org in orgs]})

@base.route('/base/syorganization!doNotNeedSecurity_comboTree.action', methods=['POST'])
def syorganization_comboTree():
    orgs = Organization.query.all()

    return jsonify([org.to_json() for org in orgs])


@base.route('/base/syorganization!doNotNeedSecurity_getSyorganizationsTree.action', methods=['POST'])
def get_syorganizations_tree():
    orgs = Organization.query.join(User, Organization.users).filter(User.ID == current_user.ID).all()
    return jsonify([org.to_json() for org in orgs])

@base.route('/base/syorganization!doNotNeedSecurity_getSyorganizationByUserId.action', methods=['POST'])
def get_syorganization_by_userId():
    orgs = Organization.query.join(User, Organization.users).filter(User.ID == request.form.get('id')).all()
    return jsonify([org.to_json() for org in orgs])

@base.route('/system/dept/<string:id>', methods=['GET'])
def syorganization_getById(id):
    org = Organization.query.get(id)

    if org:
        return jsonify({'msg': '操作成功', 'code': 200, 'data': org.to_json()})
    else:
        return jsonify({'success': False, 'msg': 'error'})

@base.route('/system/dept', methods=['PUT'])
def syorganization_update():
    org = Organization.query.get(request.json['deptId'])

    org.UPDATEDATETIME = datetime.now()
    if 'deptName' in request.json:  org.NAME = request.json['deptName']
    if 'email' in request.json: org.EMAIL = request.json['email']
    if 'leader' in request.json: org.LEADER = request.json['leader']
    if 'phone' in request.json: org.PHONE = request.json['phone']
    if 'orderNum' in request.json:  org.SEQ = request.json['orderNum']
    if 'parentId' in request.json: org.parent = Organization.query.get(request.json['parentId'])

    db.session.add(org)

    return jsonify({'code': 200, 'msg': '操作成功'})

@base.route('/system/dept', methods=['POST'])
def syorganization_save():
    org = Organization()
    org.ID = str(uuid.uuid4())
    if 'deptName' in request.json:  org.NAME = request.json['deptName']
    if 'email' in request.json: org.EMAIL = request.json['email']
    if 'leader' in request.json: org.LEADER = request.json['leader']
    if 'phone' in request.json: org.PHONE = request.json['phone']
    if 'orderNum' in request.json: org.SEQ = request.json['orderNum']
    if 'parentId' in request.json: org.parent = Organization.query.get(request.json['parentId'])

    # add organization to current user
    current_user.organizations.append(org)

    db.session.add(org)

    return jsonify({'code': 200, 'msg': '操作成功'})

