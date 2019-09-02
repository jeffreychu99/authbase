from app import db
from datetime import datetime

class DictData(db.Model):
    __tablename__ = 'SYS_DICT_DATA'
    dict_code = db.Column(db.Integer, primary_key=True)
    dict_sort = db.Column(db.Integer)
    dict_label = db.Column(db.String(100))
    dict_value = db.Column(db.String(100))
    dict_type = db.Column(db.String(100), db.ForeignKey('SYS_DICT_TYPE.dict_type'))
    css_class = db.Column(db.String(100))
    list_class = db.Column(db.String(100))
    is_default = db.Column(db.Integer)
    status = db.Column(db.Integer)
    create_by = db.Column(db.String(64))
    create_time = db.Column(db.DATETIME, default=datetime.now)
    update_by = db.Column(db.String(64))
    update_time = db.Column(db.DATETIME, default=datetime.now)
    remark = db.Column(db.String(500))

    def to_json(self):
        return {
            'dictCode': self.dict_code,
            'dictSort': self.dict_sort,
            'dictLabel': self.dict_label,
            'dictValue': self.dict_value,
            'dictType': self.dict_type,
            'cssClass': self.css_class,
            'listClass': self.list_class,
            'isDefault': self.is_default,
            'status': self.status,
            'createBy': self.create_by,
            'createTime': self.create_time,
            'updateBy': self.update_by,
            'updateTime': self.update_time,
            'remark': self.remark
        }

    def __repr__(self):
        return '<DictData %r>\n' %(self.dict_label)