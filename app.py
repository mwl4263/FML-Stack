import flask
import time
import os
import sys
import __future__
import mysql.connector

app = flask.Flask(__name__)
db = mysql.connector.connect(user='root', password='what4k1ll3r', host='localhost', database='Cards')
cursor = db.cursor()


def fillDatabase():
    print("Loading the database...")
    cursor.execute("SOURCE db.sql")





@app.route('/')
def index():
    return flask.render_template('login.html')







