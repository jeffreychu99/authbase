from ..base import base
from ..models import OnLine
from flask import render_template, request, jsonify
from sqlalchemy import asc
from sqlalchemy import desc
import flask_excel as excel
from flask_login import login_required

@base.route('/monitor/logininfor/list', methods=['GET'])
@login_required
def grid_online():
    filters = []
    if request.args.get('userName'):
        filters.append(OnLine.LOGINNAME.like('%' + request.args.get('userName') + '%'))
    if request.args.get('ipaddr'):
        filters.append(OnLine.IP.like('%' + request.args.get('ipaddr') + '%'))
    if request.args.get('type'):
        filters.append(OnLine.TYPE == request.args.get('type'))
    if 'params[beginTime]' in request.args and 'params[endTime]' in request.args:
        filters.append(OnLine.CREATEDATETIME >  request.args['params[beginTime]'])
        filters.append(OnLine.CREATEDATETIME <  request.args['params[endTime]'])

    order_by = []
    if request.form.get('sort'):
        if request.form.get('order') == 'asc':
            order_by.append(asc(getattr(OnLine,request.form.get('sort').upper())))
        elif request.form.get('order') == 'desc':
            order_by.append(desc(getattr(OnLine,request.form.get('sort').upper())))
        else:
            order_by.append(getattr(OnLine,request.form.get('sort').upper()))

    page = request.form.get('page', 1, type=int)
    rows = request.form.get('rows', 10, type=int)
    pagination = OnLine.query.filter(*filters).order_by(*order_by).paginate(
        page=page, per_page=rows, error_out=False)
    onlines = pagination.items

    return jsonify({'total': OnLine.query.count(), 'rows': [online.to_json() for online in onlines], 'code': 200})

@base.route('/base/syonline!export.action', methods=['POST'])
@login_required
def online_export():
    rows = []
    rows.append(['登录名', 'IP地址', '创建时间', '类别'])

    onlines = OnLine.query.all()
    for online in onlines:
        row = []
        row.append(online.LOGINNAME)
        row.append(online.IP)
        row.append(online.CREATEDATETIME)
        if online.TYPE == '0':
            row.append('注销系统')
        elif online.TYPE == '1':
            row.append('登录系统')
        rows.append(row)

    return excel.make_response_from_array(rows, "csv",
                                          file_name="online")