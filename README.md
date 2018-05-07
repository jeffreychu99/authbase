#基于Flask实现后台权限管理系统

基于Python的Flask WEB框架实现后台权限管理系统，内容包含：用户管理、角色管理、资源管理和机构管理。前端页面参考了@sypro。


**完整设计文档**
[参考百度阅读](https://yuedu.baidu.com/ebook/8e8853732e60ddccda38376baf1ffc4fff47e278)

**前端依赖插件**

 1. My97DatePicker
 2. jQuery
 3. Bootstrap
 4. jQuery EasyUI
 5. jQuery Portal
 

**后端依赖插件**

 1. Flask
 2. Flask-Migrate
 3. Flask-Script
 4. Flask-SQLAlchemy
 5. Flask-Login
 6. itsdangerous
 7. Jinja2
 8. Werkzeug
 9. mysql-python

**使用方法**

1. 导入根目录下db.sql数据库脚本到mysql数据库
2. pip install -r requirements.txt。本项目下的flask是下载好的依赖，在python环境下可以直接运行。
3. python manager.py runserver
 
**讨论群**

欢迎加入python技术爱好者，群号码：297690915，内有福利！

**效果图**

![机构管理](http://images2017.cnblogs.com/blog/987815/201709/987815-20170916130952719-966287735.png)

![角色管理](http://images2017.cnblogs.com/blog/987815/201709/987815-20170916131019532-504783562.png)

![用户管理](http://images2017.cnblogs.com/blog/987815/201709/987815-20170916131029438-1012038485.png)

![资源管理](http://images2017.cnblogs.com/blog/987815/201709/987815-20170916131040344-1829634002.png)