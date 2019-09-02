from ..base import base
from flask import render_template
from flask_login import login_user, logout_user, login_required, \
    current_user
from flask import g, jsonify
from ..models import Resource, Organization, ResourceType

@base.route('/getRouters')
@login_required
def getRouters():
    resources = Resource.query.join(ResourceType, Resource.type).filter(Resource.SYRESOURCE_ID == None).all()
    
    return jsonify({'msg': '操作成功', 'code': 200, "data": [res.to_router_json() for res in resources]})    


    # return jsonify({'msg': '操作成功', 'code': 200, "data":[{"name":"System","path":"/system","hidden":False,"redirect":"noRedirect","component":"Layout","alwaysShow":True,"meta":{"title":"系统管理","icon":"system","noCache":False,"link":''},"children":[{"name":"User","path":"user","hidden":False,"component":"system/user/index","meta":{"title":"用户管理","icon":"user","noCache":False,"link":''}},{"name":"Role","path":"role","hidden":False,"component":"system/role/index","meta":{"title":"角色管理","icon":"peoples","noCache":False,"link":''}},{"name":"Menu","path":"menu","hidden":False,"component":"system/menu/index","meta":{"title":"菜单管理","icon":"tree-table","noCache":False,"link":''}},{"name":"Dept","path":"dept","hidden":False,"component":"system/dept/index","meta":{"title":"部门管理","icon":"tree","noCache":False,"link":''}},{"name":"Log","path":"log","hidden":False,"redirect":"noRedirect","component":"ParentView","alwaysShow":True,"meta":{"title":"日志管理","icon":"log","noCache":False,"link":''},"children":[{"name":"Operlog","path":"operlog","hidden":False,"component":"monitor/operlog/index","meta":{"title":"操作日志","icon":"form","noCache":False,"link":''}},{"name":"Logininfor","path":"logininfor","hidden":False,"component":"monitor/logininfor/index","meta":{"title":"登录日志","icon":"logininfor","noCache":False,"link":''}}]}]}]})
