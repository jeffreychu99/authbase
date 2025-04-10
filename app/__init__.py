from flask import Flask, render_template
from flask_moment import Moment
from flask_sqlalchemy import SQLAlchemy
from config import config
from flask_login import LoginManager
import flask_excel as excel

from flask import json
from datetime import datetime, date

from flask_login import current_user
from flask import jsonify
from functools import wraps
import logging
from logging.handlers import RotatingFileHandler
from flask_simple_captcha import CAPTCHA

CAPTCHA_CONFIG = {
    'SECRET_CAPTCHA_KEY': '5984d2c2-2721-4f51-85bf-dfcc7aedd03',
    'CAPTCHA_LENGTH': 4,
    'CAPTCHA_DIGITS': True,
    'EXPIRE_SECONDS': 600,
}

def setup_logger(name):
    logger = logging.getLogger(name)
    logger.setLevel(logging.DEBUG)

    # Create a rotating file handler
    file_handler = RotatingFileHandler('app.log', encoding='utf-8', maxBytes=10*1024*1024, backupCount=5)
    file_handler.setLevel(logging.INFO)

    console_handler = logging.StreamHandler()
    console_handler.setLevel(logging.DEBUG)

    # Create a formatter and set it for the handler
    formatter = logging.Formatter('%(asctime)s %(levelname)s %(name)s - %(message)s')
    file_handler.setFormatter(formatter)
    console_handler.setFormatter(formatter)

    # Add the handler to the logger if it hasn't been added yet
    if not logger.hasHandlers():
        logger.addHandler(file_handler)
        logger.addHandler(console_handler)

    return logger

def permission(permission_id):
    def need_permission(func):
        @wraps(func)
        def inner(*args, **kargs):
            if not current_user.ID:
                return jsonify(401, {"msg": "认证失败，无法访问系统资源"})
            else:
                resources = []
                resourceTree = []

                resources += [res for org in current_user.organizations for res in org.resources if org.resources]
                resources += [res for role in current_user.roles for res in role.resources if role.resources]
                
                # remove repeat
                new_dict = dict()
                for obj in resources:
                    if obj.ID not in new_dict:
                        new_dict[obj.ID] = obj

                for resource in new_dict.values():
                    resourceTree.append(resource.PERMS)
                if permission_id in resourceTree:
                    return func(*args, **kargs)
                else:
                    return jsonify({'msg': '当前操作没有权限', 'code': 403})
        return inner
    return need_permission
        


JSONEncoder = json.JSONEncoder

class CustomJSONEncoder(JSONEncoder):
    def default(self, obj):
        if isinstance(obj, datetime):
            return obj.strftime('%Y-%m-%d %H:%M:%S')
        elif isinstance(obj, date):
            return obj.strftime('%Y-%m-%d')
        else:
            return JSONEncoder.default(self, obj)

loginmanager = LoginManager()
loginmanager.session_protection = 'strong'
#loginmanager.login_view = 'base.login'

moment = Moment()
db = SQLAlchemy()
captcha = CAPTCHA(config=CAPTCHA_CONFIG)

def create_app(config_name):
    app = Flask(__name__)
    #  替换默认的json编码器
    app.json_encoder = CustomJSONEncoder
    app.config.from_object(config[config_name])
    config[config_name].init_app(app)

    moment.init_app(app)
    db.init_app(app)
    loginmanager.init_app(app)
    captcha.init_app(app)

    from .base import base as base_blueprint
    app.register_blueprint(base_blueprint)
    excel.init_excel(app)
    return app

