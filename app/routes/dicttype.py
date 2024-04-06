from datetime import datetime

from flask_login import current_user
from ..base import base
from ..models import DictData, DictType
from flask import render_template, request, jsonify
from sqlalchemy import asc
from sqlalchemy import desc
from .. import  db
from flask_login import login_required
from .. import permission

@base.route('/system/dict/type/list', methods=['GET'])
@login_required
@permission('system:dict:list')
def sysdict_type_list():
    filters = []
    if 'dictName' in request.args:
        filters.append(DictType.dict_name.like('%' + request.args['dictName'] + '%'))
    if 'dictType' in request.args:
        filters.append(DictType.dict_type.like('%' + request.args['dictType'] + '%'))

    if 'status' in request.args:
        filters.append(DictType.status == request.args['status'])


    if 'params[beginTime]' in request.args and 'params[endTime]' in request.args:
        filters.append(DictType.create_time >  request.args['params[beginTime]'])
        filters.append(DictType.create_time <  request.args['params[endTime]'])

    page = request.args.get('pageNum', 1, type=int)
    rows = request.args.get('pageSize', 10, type=int)
    pagination = DictType.query.filter(*filters).paginate(
        page=page, per_page=rows, error_out=False)
    types = pagination.items

    return jsonify({'msg': '操作成功', 'code': 200, 'rows': [type.to_json() for type in types], 'total': pagination.total})

@base.route('/system/dict/type/<id>', methods=['GET'])
@login_required
@permission('system:dict:query')
def sysdict_type_get_by_id(id):
    type = DictType.query.get(id)

    return jsonify({'msg': '操作成功', 'code': 200, 'data': type.to_json()})

@base.route('/system/dict/type', methods=['POST'])
@login_required
@permission('system:dict:add')
def sysdict_type_add():
    dictType = DictType()

    if 'dictName' in request.json: dictType.dict_name = request.json['dictName']
    if 'status' in request.json: dictType.status = request.json['status']
    if 'remark' in request.json: dictType.remark = request.json['remark']
    if 'dictType' in request.json: dictType.dict_type = request.json['dictType']

    dictType.create_time = datetime.now()
    dictType.create_by = current_user.NAME
    dictType.update_time = datetime.now()
    dictType.update_by = current_user.NAME

    db.session.add(dictType)

    return jsonify({'code': 200, 'msg': '操作成功'})

@base.route('/system/dict/type', methods=['PUT'])
@login_required
@permission('system:dict:edit')
def sysdict_type_update():
    dictType = DictType.query.get(request.json['dictId'])

    if 'dictName' in request.json: dictType.dict_name = request.json['dictName']
    if 'status' in request.json: dictType.status = request.json['status']
    if 'remark' in request.json: dictType.remark = request.json['remark']
    if 'dictType' in request.json: dictType.dict_type = request.json['dictType']

    dictType.update_time = datetime.now()
    dictType.update_by = current_user.NAME

    db.session.add(dictType)

    return jsonify({'msg': '操作成功', 'code': 200})

@base.route('/system/dict/type/<string:ids>', methods=['DELETE'])
@login_required
@permission('system:dict:remove')
def sytype_delete(ids):
    idList = ids.split(',')
    for id in idList:
        dictType = DictType.query.get(id)
        if dictType:
            db.session.delete(dictType)

    return jsonify({'code': 200, 'msg': '操作成功'})

@base.route('/system/dict/type/optionselect', methods=['GET'])
@login_required
def sysdict_type_all():
    types = DictData.query.all()

    return jsonify({'msg': '操作成功', 'code': 200, 'data': [type.to_json() for type in types]})   

