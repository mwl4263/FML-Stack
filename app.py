import flask
import time
import os
import sys
import __future__
import mysql.connector

app = flask.Flask(__name__)
db = mysql.connector.connect(user='root', password='whatever', host='localhost', database='Cards')
cursor = db.cursor()


def fillDatabase():
    print("Loading the database...")





@app.route('/')
def index():
    username = "Mason Lapine"
    return flask.render_template('index.html', username=username)







