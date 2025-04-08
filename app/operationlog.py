from .models import OperationLog
from . import setup_logger
from functools import wraps
from flask import request
from flask_login import current_user
from . import db

logger = setup_logger(__name__)

def log_operation(operation_name):
    def decorator(f):
        @wraps(f)
        def decorated_function(*args, **kwargs):
            # Log operation details
            method = request.method
            path = request.path
            
            # Log query parameters
            if method in ['GET', 'DELETE']:
                params = request.args.to_dict()
            else:  # POST/PUT
                params = request.get_json(silent=True) or {}
                
            # Log to console
            logger.info(f"Operation: {operation_name}, Method: {method}, Path: {path}, Params: {params}")

            # Save to database
            log_entry = OperationLog(
                OPERATION_NAME=operation_name,
                METHOD=method,
                PATH=path,
                PARAMS=str(params),
                OPERATOR = current_user.NAME if current_user else ''
            )
            db.session.add(log_entry)
            db.session.commit()
            
            return f(*args, **kwargs)
        return decorated_function
    return decorator