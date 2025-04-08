from ..base import base
from flask import render_template, request, jsonify
from sqlalchemy import asc
from sqlalchemy import desc
import flask_excel as excel
from flask_login import login_required
from .. import permission
from ..models import OperationLog
from .. import  db

@base.route('/monitor/operlog/list', methods=['GET'])
@login_required
@permission('monitor:operlog:list')
def grid_operationlog():
    filters = []
    if request.args.get('operator'):
        filters.append(OperationLog.OPERATOR.like('%' + request.args.get('operator') + '%'))
    if 'params[beginTime]' in request.args and 'params[endTime]' in request.args:
        filters.append(OperationLog.CREATEDATETIME >  request.args['params[beginTime]'])
        filters.append(OperationLog.CREATEDATETIME <  request.args['params[endTime]'])

    order_by = []
    if request.args.get('orderByColumn'):
        if request.args.get('isAsc') == 'ascending':
            order_by.append(asc(getattr(OperationLog,request.args.get('orderByColumn').upper())))
        elif request.args.get('isAsc') == 'descending':
            order_by.append(desc(getattr(OperationLog,request.args.get('orderByColumn').upper())))
        else:
            order_by.append(getattr(OperationLog,request.args.get('orderByColumn').upper()))

    page = request.args.get('pageNum', 1, type=int)
    rows = request.args.get('pageSize', 10, type=int)
    pagination = OperationLog.query.filter(*filters).order_by(*order_by).paginate(
        page=page, per_page=rows, error_out=False)
    operationlogs = pagination.items

    return jsonify({'total': pagination.total, 'rows': [operationlog.to_json() for operationlog in operationlogs], 'code': 200})

@base.route('/monitor/operlog/export', methods=['POST'])
@login_required
@permission('monitor:operlog:export')
def operationlog_export():
    rows = []
    rows.append(['操作名称', '请求方法', '请求路径', '请求参数', '操作人员', '操作时间'])

    operationlogs = OperationLog.query.all()
    for operationlog in operationlogs:
        row = []
        row.append(operationlog.OPERATION_NAME)
        row.append(operationlog.METHOD)
        row.append(operationlog.PATH)
        row.append(operationlog.PARAMS)
        row.append(operationlog.OPERATOR)
        if operationlog.CREATEDATETIME:
            row.append(operationlog.CREATEDATETIME.strftime('%Y-%m-%d %H:%M:%S'))
        else:
            row.append('')
        rows.append(row)

    return excel.make_response_from_array(rows, "xlsx", file_name="operationlog")

@base.route('/monitor/operlog/clean', methods=['DELETE'])
@login_required
@permission('monitor:operlog:clean')
def operationlog_clean():
    OperationLog.query.delete()
    return jsonify({'code': 200, 'msg': '操作日志已清空！'})

@base.route('/monitor/operlog/<string:ids>', methods=['DELETE'])
@login_required
@permission('monitor:operlog:remove')
def operationlog_remove(ids):
    idList = ids.split(',')
    for id in idList:
        operationlog = OperationLog.query.get(id)
        if operationlog:
            db.session.delete(operationlog)
    return jsonify({'code': 200, 'msg': '操作日志已删除！'})
    
@base.route('/monitor/operlog/<id>', methods=['GET'])
@login_required
@permission('monitor:operlog:query')
def operationlog_detail(id):
    operationlog = OperationLog.query.get(id)
    if operationlog:
        return jsonify({'code': 200, 'msg': '操作日志详情', 'data': operationlog.to_json()})
    else:
        return jsonify({'code': 404, 'msg': '操作日志不存在！'})