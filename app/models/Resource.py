from app import db
from flask_login import UserMixin, AnonymousUserMixin
from datetime import datetime
from flask import jsonify


class Resource(db.Model, UserMixin):
    __tablename__ = 'SYRESOURCE'
    __mapper_args__ = {
     #"order_by": 'SEQ'
    }
    ID = db.Column(db.String(36), primary_key=True)
    CREATEDATETIME = db.Column(db.DateTime, index=True, default=datetime.now)
    UPDATEDATETIME = db.Column(db.DateTime, index=True, default=datetime.now)
    NAME = db.Column(db.String(100))
    URL = db.Column(db.String(200))
    PATH = db.Column(db.String(200))
    PERMS = db.Column(db.String(150))
    DESCRIPTION = db.Column(db.String(200))
    ICONCLS = db.Column(db.String(100))
    SEQ = db.Column(db.Integer)
    TARGET = db.Column(db.String(100))

    SYRESOURCETYPE_ID = db.Column(db.String, db.ForeignKey('SYRESOURCETYPE.ID'))

    SYRESOURCE_ID = db.Column(db.String, db.ForeignKey('SYRESOURCE.ID'))

    parent = db.relationship('Resource', remote_side=[ID], backref='resource', uselist=False)

    children = db.relationship('Resource')

    def get_id(self):
        return str(self.ID)

    def to_json(self):
        return {
            'menuId': self.ID,
            'createTime': self.CREATEDATETIME,
            'updateTime': self.UPDATEDATETIME,
            'menuName': self.NAME,
            'component': self.URL,
            'description': self.DESCRIPTION,
            'icon': self.ICONCLS,
            'orderNum': self.SEQ,
            'target': self.TARGET,
            'parentId': self.get_pid(),
            'syresourcetype': self.get_type_json(),
            'status': '0',
            'visible': '0',
            'isFrame': '1',
            'path': self.PATH,
            'perms': self.PERMS,
            'isCache': '1',
            # 类型（M目录 C菜单 F按钮）
            'menuType': 'F' if self.SYRESOURCETYPE_ID == '1' else 'C' if self.SYRESOURCETYPE_ID == '0' else 'M'
        }

    def to_tree_select_json(self):
        return {
            'id': self.ID,
            'label': self.NAME,
            'children': [res.to_tree_select_json() for res in self.children]
        }

    def to_router_json(self):
        router = {
            'name': self.PATH.capitalize(),
            'path': self.PATH,
            'hidden': False,
            'redirect': 'noRedirect',
            'component': self.URL,
            'alwaysShow': True,
            'meta': {
                'title': self.NAME,
                'icon': self.ICONCLS,
                'noCache': False,
                'link':''
            },
            'children': [
                res.to_router_json() for res in self.children if res.type.ID == '3' or res.type.ID == '0'
            ]
        }

        if not router['children']:
            del router['children']
            del router['redirect']
            del router['alwaysShow']
        if not router['component']:
            router['component'] = 'Layout'

        return router

    def to_menu_json(self):
        return {
            'id': self.ID,
            'iconCls': self.ICONCLS,
            'pid': self.get_pid(),
            'state': 'open',
            'checked': False,
            'attributes': {
                'target': self.TARGET,
                'url': self.URL
            },
            'text': self.NAME
        }

    def get_pid(self):
        if self.parent:
            return self.parent.ID
        return ''

    def get_type_json(self):
        if self.type:
            return self.type.to_json()
        return {}

    def __repr__(self):
        return '<Resource name:%r url:%r>\n' %(self.NAME, self.URL)