from app import db, loginmanager
from flask_login import UserMixin, AnonymousUserMixin
from datetime import datetime

@loginmanager.user_loader
def load_user(user_id):
    return User.query.filter(User.ID == user_id).first()

user_organization_table = db.Table('SYUSER_SYORGANIZATION', db.Model.metadata
                                   , db.Column('SYUSER_ID', db.String, db.ForeignKey('SYUSER.ID'))
                                   , db.Column('SYORGANIZATION_ID', db.String, db.ForeignKey('SYORGANIZATION.ID')))

user_role_table = db.Table('SYUSER_SYROLE', db.Model.metadata
                           , db.Column('SYUSER_ID', db.String, db.ForeignKey('SYUSER.ID'))
                           , db.Column('SYROLE_ID', db.String, db.ForeignKey('SYROLE.ID')))

class User(db.Model, UserMixin):
    __tablename__ = 'SYUSER'
    ID = db.Column(db.String(36), primary_key=True)
    CREATEDATETIME = db.Column(db.DateTime, index=True, default=datetime.now)
    UPDATEDATETIME = db.Column(db.DateTime, index=True, default=datetime.now)
    LOGINNAME = db.Column(db.String(100), unique=True, index=True)
    PWD = db.Column(db.String(100))
    NAME = db.Column(db.String(100))
    SEX = db.Column(db.String(1))
    AGE = db.Column(db.Integer)
    PHOTO = db.Column(db.String(200))
    EMPLOYDATE = db.Column(db.DATETIME, default=datetime.now)
    EMAIL = db.Column(db.String(50))
    PHONENUMBER = db.Column(db.String(11))
    STATUS = db.Column(db.String(10))

    organizations = db.relationship('Organization',
                                    secondary=user_organization_table,
                                    backref=db.backref('users', lazy='dynamic'),)

    roles = db.relationship('Role',
                            secondary=user_role_table,
                            backref=db.backref('users', lazy='dynamic'),
                            lazy="dynamic")

    def get_id(self):
        return str(self.ID)

    def have_permission(self, url):
        permissions = []
        for role in self.roles:
            permissions.extend([resource for resource in role.resources])

        if filter(lambda x: x.URL == url, permissions):
            return True

        permissions = []
        for organization in self.organizations:
            permissions.extend([resource for resource in organization.resources])

        return filter(lambda x: x.NAME == url, permissions)
        
    def __repr__(self):
        return '<User %r>\n' %(self.NAME)

    def to_json(self):
        json = {
            'userId': self.ID,
            'createTime': self.CREATEDATETIME.strftime('%Y-%m-%d %H:%M:%S'),
            'updateTime': self.UPDATEDATETIME.strftime('%Y-%m-%d %H:%M:%S'),
            'userName': self.LOGINNAME,
            'nickName': self.NAME,
            'sex': self.SEX,
            'age': self.AGE,
            "status": self.STATUS,
            'photo': self.PHOTO,
            'email': self.EMAIL,
            'phonenumber': self.PHONENUMBER
            #'employdate': self.EMPLOYDATE.strftime('%Y-%m-%d %H:%M:%S'),
        }

        if len(self.organizations) > 0:
            json['dept']  = self.organizations[0].to_json()
            json['deptId'] = self.organizations[0].ID

        if len(self.roles.all()) > 0:
            json['roles'] = [role.to_json() for role in self.roles.all()]

        return json         