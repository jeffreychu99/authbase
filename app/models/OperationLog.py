from app import db
from datetime import datetime

class OperationLog(db.Model):
    __tablename__ = 'SYOPERATIONLOG'
    ID = db.Column(db.Integer, primary_key=True)
    OPERATION_NAME = db.Column(db.String(100))
    METHOD = db.Column(db.String(10))
    PATH = db.Column(db.String(200))
    PARAMS = db.Column(db.Text)
    OPERATOR = db.Column(db.String(50))
    OPERATIONTIME = db.Column(db.Integer)
    RESPONSE = db.Column(db.Text)
    EXECEPTION = db.Column(db.Text)
    RESULT = db.Column(db.Integer)
    CREATEDATETIME = db.Column(db.DateTime, index=True, default=datetime.now)

    def __repr__(self):
        return f'<OperationLog {self.ID}>\n'
    
    def to_json(self):
        return {
            'id': self.ID,
            'operationName': self.OPERATION_NAME,
            'method': self.METHOD,
            'path': self.PATH,
            'params': self.PARAMS,
            'operator': self.OPERATOR,
            'operationTime': self.OPERATIONTIME,
            'response': self.RESPONSE,
            'exception': self.EXECEPTION,
            'result': self.RESULT,
            'createDateTime': self.CREATEDATETIME.strftime('%Y-%m-%d %H:%M:%S')
        }   