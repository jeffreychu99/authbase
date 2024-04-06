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

@base.route('/system/dict/data/type/<dictType>', methods=['GET'])
@login_required
def sysdictdata_get_by_type(dictType):
    data_list = DictData.query.filter(DictData.dict_type == dictType)

    return jsonify({'msg': '操作成功', 'code': 200, 'data': [data.to_json() for data in data_list]})


@base.route('/system/dict/data/list', methods=['GET'])
@login_required
@permission('system:dict:list')
def sysdict_data_list():
    filters = []
    if 'dictLabel' in request.args:
        filters.append(DictData.dict_label.like('%' + request.args['dictLabel'] + '%'))
    if 'dictType' in request.args:
        filters.append(DictData.dict_type.like('%' + request.args['dictType'] + '%'))

    if 'status' in request.args:
        filters.append(DictData.status == request.args['status'])

    page = request.args.get('pageNum', 1, type=int)
    rows = request.args.get('pageSize', 10, type=int)
    pagination = DictData.query.filter(*filters).paginate(
        page=page, per_page=rows, error_out=False)
    data_list = pagination.items

    return jsonify({'msg': '操作成功', 'code': 200, 'rows': [data.to_json() for data in data_list], 'total': pagination.total})

@base.route('/system/dict/data/<id>', methods=['GET'])
@login_required
@permission('system:dict:query')
def sysdict_data_get_by_id(id):
    data = DictData.query.get(id)

    return jsonify({'msg': '操作成功', 'code': 200, 'data': data.to_json()})

@base.route('/system/dict/data', methods=['POST'])
@login_required
@permission('system:dict:add')
def sysdict_data_add():
    dictData = DictData()

    if 'dictLabel' in request.json: dictData.dict_label = request.json['dictLabel']
    if 'dictSort' in request.json: dictData.dict_sort = request.json['dictSort']
    if 'dictType' in request.json: dictData.dict_type = request.json['dictType']
    if 'dictValue' in request.json: dictData.dict_value = request.json['dictValue']
    if 'listClass' in request.json: dictData.list_class = request.json['listClass']
    if 'status' in request.json: dictData.status = request.json['status']

    dictData.create_time = datetime.now()
    dictData.create_by = current_user.NAME

    db.session.add(dictData)

    return jsonify({'code': 200, 'msg': '操作成功'})

@base.route('/system/dict/data', methods=['PUT'])
@login_required
@permission('system:dict:edit')
def sysdict_data_update():
    dictData = DictData.query.get(request.json['dictCode'])

    if 'dictLabel' in request.json: dictData.dict_label = request.json['dictLabel']
    if 'dictSort' in request.json: dictData.dict_sort = request.json['dictSort']
    if 'dictType' in request.json: dictData.dict_type = request.json['dictType']
    if 'dictValue' in request.json: dictData.dict_value = request.json['dictValue']
    if 'listClass' in request.json: dictData.list_class = request.json['listClass']
    if 'status' in request.json: dictData.status = request.json['status']
    if 'remark' in request.json: dictData.remark = request.json['remark']
    if 'isDefault' in request.json: dictData.is_default = request.json['isDefault']

    dictData.update_time = datetime.now()
    dictData.update_by = current_user.NAME

    db.session.add(dictData)

    return jsonify({'msg': '操作成功', 'code': 200})

@base.route('/system/dict/data/<string:ids>', methods=['DELETE'])
@login_required
@permission('system:dict:remove')
def sydata_delete(ids):
    idList = ids.split(',')
    for id in idList:
        dictData = DictData.query.get(id)
        if dictData:
            db.session.delete(dictData)

    return jsonify({'code': 200, 'msg': '操作成功'})


 
