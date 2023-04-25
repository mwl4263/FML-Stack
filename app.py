import flask
import time
import os
import sys


app = flask.Flask(__name__)


@app.route('/')
def index():
    return flask.render_template('index.html')







