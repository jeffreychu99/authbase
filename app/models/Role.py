# coding:utf-8
from app import db
from flask_login import UserMixin, AnonymousUserMixin
from datetime import datetime

#角色资源关联表
role_resource_table = db.Table('SYROLE_SYRESOURCE', db.metadata,
                               db.Column('SYROLE_ID', db.String, db.ForeignKey('SYROLE.ID')),
                               db.Column('SYRESOURCE_ID', db.String, db.ForeignKey('SYRESOURCE.ID')))

role_organization_table = db.Table('SYROLE_SYORGANIZATION', db.metadata,
                               db.Column('SYROLE_ID', db.String, db.ForeignKey('SYROLE.ID')),
                               db.Column('SYORGANIZATION_ID', db.String, db.ForeignKey('SYORGANIZATION.ID')))

class Role(db.Model, UserMixin):
    __tablename__ = 'SYROLE'
    ID = db.Column(db.Integer, primary_key=True)
    CREATEDATETIME = db.Column(db.DateTime, index=True, default=datetime.now)
    UPDATEDATETIME = db.Column(db.DateTime, index=True, default=datetime.now)
    NAME = db.Column(db.String(100))
    DESCRIPTION = db.Column(db.String(200))
    ICONCLS = db.Column(db.String(100))
    SEQ = db.Column(db.Integer)
    ROLEKEY = db.Column(db.String(100))
    DATASCOPE = db.Column(db.Integer)

    #包含资源
    resources = db.relationship('Resource',
                                secondary=role_resource_table,
                                backref=db.backref('roles', lazy='dynamic')) #资源所属角色

    #包含部门
    depts = db.relationship('Organization',
                                secondary=role_organization_table,
                                backref=db.backref('roles', lazy='dynamic')) #部门所属角色
    def get_id(self):
        return str(self.ID)

    def to_dict(self):
        return dict([(k, getattr(self, k)) for k in self.__dict__.keys() if not k.startswith("_")])

    def __repr__(self):
        return '<Role name:%r description:%r iconCls:%r seq:%r>\n'  \
             %(self.NAME, self.DESCRIPTION, self.ICONCLS, self.SEQ)

    def to_json(self):
        json = {
            'roleId': self.ID,
            'createTime': self.CREATEDATETIME.strftime('%Y-%m-%d %H:%M:%S'),
            'updateTime': self.UPDATEDATETIME.strftime('%Y-%m-%d %H:%M:%S'),
            'roleName': self.NAME,
            'remark': self.DESCRIPTION,
            'iconCls': self.ICONCLS,
            'roleSort': self.SEQ,
            'status': '0',
            'roleKey': self.ROLEKEY,
            'dataScope': self.DATASCOPE
        }

        
        if hasattr(self, 'flag'):
            json['flag'] = self.flag

        return json
