from app import db
from datetime import datetime

class DictType(db.Model):
    __tablename__ = 'SYS_DICT_TYPE'
    dict_id = db.Column(db.Integer, primary_key=True)
    dict_name = db.Column(db.String(100))
    dict_type = db.Column(db.String(100))
    status = db.Column(db.Integer)
    create_by = db.Column(db.String(64))
    create_time = db.Column(db.DATETIME, default=datetime.now)
    update_by = db.Column(db.String(64))
    update_time = db.Column(db.DATETIME, default=datetime.now)
    remark = db.Column(db.String(500))

    data_list =  db.relationship('DictData', backref='type', lazy='dynamic')

    def to_json(self):
        return {
            'dictId': self.dict_id,
            'dictName': self.dict_name,
            'dictType': self.dict_type,
            'status': self.status,
            'createBy': self.create_by,
            'createTime': self.create_time,
            'updateBy': self.update_by,
            'updateTime': self.update_time,
            'remark': self.remark,
        }

    def __repr__(self):
        return '<DictType %r>\n' %(self.dict_name)