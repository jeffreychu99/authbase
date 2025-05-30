#基于Flask实现后台权限管理系统

**升级Flask版本到2.2.5及其其它相关依赖**

**python后台启动方式更新: python3.x -m flask --app start run**

**重磅！！！！！！！！！！！**

**全新的风格界面，完全的前后端分离。基于ElementUI，前端代码基于RuoYi-UI，后端接口进行适配**

基于Python的Flask WEB框架实现后台权限管理系统，内容包含：用户管理、角色管理、资源管理和机构管理。

>套用Python社区的一句话，人生苦短，我用Python，本开源项目前端界面优美，后端代码精炼，希望能够帮助到有需要的朋友。

**系统已经切换python 3，我的是在python 3.7.0下测试的，理论上Python 3版本应该都是可以运行的。需要Python 2版本的朋友可以checkout到python2分支。**


**完整设计文档**

![设计文档](doc/design.png)

>有些同学上来就问我这个怎么运行，原则上我不予回答，我已经开放源码了，照着步骤做肯定是可以运行的。

**如果有需要详细设计电子书的同学，10元一本，一杯奶茶不到的价格，写作不容易。**

**另外针对一些特别基础的小白，有偿提供咨询服务，咨询费39.9元，同时提供详细设计电子书一本。**

**支持有偿系统定制，学生编程作业、毕业设计都可以，和本系统无关也行，根据具体情况，几百几千不等，具体可以微信私聊。**

**加我微信支付，备注authbase。**
   
**微信号是jeffrey-chu**

![微信号](doc/wx.png)

**感谢很多同学的信任，诚心服务每一位有需要的同学。**

![](doc/support.png)

**Docker运行**

我已经将系统打包到docker镜像中，镜像中包含：
1. ubuntu 20.04
2. authbase代码
3. mysql server 8.0。数据库账户密码authbase/123456


具体方法参考源码中的docker目录。

镜像基于阿里云容器镜像服务进行自动构建

如何使用

1. docker pull registry.cn-hangzhou.aliyuncs.com/zisokal/authbase:1.1
2. docker run -d -p 5000:5000 -p 80:80 \
	-e DEV_DATABASE_URI="mysql+mysqlconnector://authbase:123456@127.0.0.1/authbase?charset=utf8" \
	--name authbase registry.cn-hangzhou.aliyuncs.com/zisokal/authbase:1.1
3. 打开浏览器访问页面 http://localhost   
   系统默认的登录名密码为admin/123456



**前端依赖插件**

 1. Vue
 2. Vuex
 3. ElementUI
 4. Axios
 

**后端依赖插件**

 1. Flask
 2. Flask-SQLAlchemy
 3. Flask-Login
 4. Flask-moment
 5. MySQL-connector-python
 6. Flask-Excel

**使用方法**

前端启动：

1. 安装Node.js
2. 进入源代码的ui目录。cd ui
3. npm install
4. npm run dev

后端启动：

1. mysql创建名为authbase的数据库(因为机构查询用到了CTE，所以MYSQL需要8.0以上版本)；
2. 导入根目录下db.sql数据库脚本到authbase数据库中；
3. pip3 install -r requirements.txt；
4. 更改config.py DevelopmentConfig类下的数据库连接，提供用户名密码；
5. 启动后端。最简单的方式：python start.py

   当然也可以这样：

   python3 -m flask --app start run [-h 0.0.0.0] [-p 8080]

   说明一下：[]里面是可选项的，如果加上，请去掉中括号：

   python3 -m flask --app start run

   或

   python3 -m flask --app start run -h 0.0.0.0 -p 8080

**讨论群**

欢迎加入python技术爱好者，群号码：297690915

**效果图**

![登陆](doc/登陆.png)

![首页](doc/首页.png)

![个人中心](doc/个人中心.png)

![机构管理](doc/机构管理.png)

![角色管理](doc/角色管理.png)

![用户管理](doc/用户管理.png)

![资源管理](doc/资源管理.png)

![登录历史](doc/登录历史.png)

![操作日志](doc/操作日志.png)

![服务监控](doc/server.png)

**图书资源推荐**

![小程序](doc/扫码_搜索联合传播样式-标准色版.png)