import flask
import time
import os
import sys


app = flask.Flask(__name__)


@app.route('/')
def index():
    username = "Mason Lapine"
    return flask.render_template('index.html', username=username)







