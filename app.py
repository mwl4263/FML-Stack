import flask
import time
import os
import sys



@app.route('/')
def index():
    return flask.render_template('templates/index.html')





app = flask.Flask(__name__)


