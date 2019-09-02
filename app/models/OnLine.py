from app import db
from datetime import datetime

class OnLine(db.Model):
    __tablename__ = 'SYONLINE'
    ID = db.Column(db.String(36), primary_key=True)
    CREATEDATETIME = db.Column(db.DateTime, index=True, default=datetime.now)
    LOGINNAME = db.Column(db.String(100))
    IP = db.Column(db.String(100))
    TYPE = db.Column(db.String(1))

    def get_id(self):
        return str(self.ID)

    def __repr__(self):
        return '<Oneline %r>\n' %(self.LOGINNAME)

    def to_json(self):
        return {
            'infoId': self.ID,
            'loginTime': self.CREATEDATETIME.strftime('%Y-%m-%d %H:%M:%S'),
            'userName': self.LOGINNAME,
            'ipaddr': self.IP,
            'type': self.TYPE
        }   