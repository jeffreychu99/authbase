from app import db
from flask_login import UserMixin, AnonymousUserMixin
from datetime import datetime

organization_resource_table = db.Table('SYORGANIZATION_SYRESOURCE', db.metadata,
                                       db.Column('SYRESOURCE_ID', db.String, db.ForeignKey('SYRESOURCE.ID')),
                                       db.Column('SYORGANIZATION_ID', db.String, db.ForeignKey('SYORGANIZATION.ID')))


class Organization(db.Model, UserMixin):
    __tablename__ = 'SYORGANIZATION'
    ID = db.Column(db.String(36), primary_key=True)
    CREATEDATETIME = db.Column(db.DateTime, index=True, default=datetime.now)
    UPDATEDATETIME = db.Column(db.DateTime, index=True, default=datetime.now)
    NAME = db.Column(db.String(200))
    ADDRESS = db.Column(db.String(200))
    CODE = db.Column(db.String(200))
    ICONCLS = db.Column(db.String(100))
    SEQ = db.Column(db.Integer)
    LEADER = db.Column(db.String(20))
    PHONE = db.Column(db.String(11))
    EMAIL = db.Column(db.String(50))
    STATUS = db.Column(db.String(10))

    resources = db.relationship('Resource',
                                secondary=organization_resource_table,
                                backref=db.backref('organizations', lazy='dynamic'))

    SYORGANIZATION_ID = db.Column(db.String, db.ForeignKey('SYORGANIZATION.ID'))

    parent = db.relationship('Organization', remote_side=[ID], backref='organization', uselist=False)

    children = db.relationship('Organization')

    def to_json(self):
        return {
            'deptId': self.ID,
            'createTime': self.CREATEDATETIME,
            'updateTime': self.UPDATEDATETIME,
            'deptName': self.NAME,
            'address': self.ADDRESS,
            'code': self.CODE,
            'iconCls': self.ICONCLS,
            'orderNum': self.SEQ,
            'parentId': self.get_pid(),
            'leader': self.LEADER,
            'phone': self.PHONE,
            'email': self.EMAIL,
            'status': self.STATUS,
            'children': [
                org.to_json() for org in self.children
            ]
        }
    
    def to_tree_select_json(self):
        return {
            'id': self.ID,
            'label': self.NAME,
            'children': [org.to_tree_select_json() for org in self.children]
        }

    def get_pid(self):
        if self.parent:
            return self.parent.ID
        return ''

    def get_id(self):
        return str(self.ID)

    def __repr__(self):
        return '<Organization %r>\n' %(self.NAME)