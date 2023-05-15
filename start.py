import os
from app import create_app, db
from flask import g, render_template

app = create_app(os.getenv('FLASK_CONFIG') or 'default')

@app.errorhandler(404)
def page_not_found(e):
    return render_template('errors/404.html'), 404