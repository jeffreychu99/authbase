import os
from app import create_app, db
from flask import request, render_template, jsonify

app = create_app(os.getenv('FLASK_CONFIG') or 'default')

@app.errorhandler(404)
def page_not_found(e):
    return render_template('errors/404.html'), 404

@app.before_request
def before():
    # print("请求地址：" + str(request.path))
    # print("请求方法：" + str(request.method))
    # print("---请求headers--start--")
    # print(str(request.headers).rstrip())
    # print("---请求headers--end----")
    # print("GET参数：" + str(request.args))
    # print("POST参数：" + str(request.form))

    url = request.path  # 当前请求的URL
    passUrl = ["/login"]
    if url in passUrl:
        pass
    # else:
    #     return jsonify({'msg': '当前操作没有权限', 'code': 403})
    #     _id = session.get("_id", None)
    #     if not _id:
    #         return jsonify(401, {"msg": "认证失败，无法访问系统资源"})
    #     else:
    #         pass
