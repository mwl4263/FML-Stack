
from flask import Flask, render_template, request, redirect, url_for, session
import time
import os
import sys
import __future__
import mysql.connector
app = Flask(__name__)
db = mysql.connector.connect(user='root', password='what4k1ll3r', host='localhost', database='Cards')
cursor = db.cursor()


def fillDatabase():
    print("Loading the database...")
    cursor.execute("SOURCE db.sql")

def queryDB(query):
    cursor.execute(query)
    return cursor.fetchall()

@app.route('/home/<data>')
def home(data):
    print("Username: " + str(data))
    query = "SELECT firstname, lastname, username FROM Users WHERE username = '%s'" % (data)
    names = list(queryDB(query)[0])
    return render_template('index.html', firstname=names[0], lastname=names[1], username=names[2])

@app.route('/')
def index():
    cursor.execute("use Cards")
    return render_template('login.html')

@app.route('/login', methods=['POST'])
def login():
    print("Login attempted")
    if request.method == "POST":
        print("Processing POST Request")
        query = "SELECT * FROM Users WHERE username = '%s' AND password = '%s'" % (request.form.get('uname'), request.form.get('psw'))
        print(query)
        cursor.execute(query)
        loginResults = cursor.fetchall()
        if len(loginResults) == 0:
            return "Failed to login"
        else :
            return redirect(url_for("home", data=list(loginResults[0])[4]))
    else:
        return "Failed to login"




