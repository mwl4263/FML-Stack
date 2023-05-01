
from flask import Flask, render_template, request, redirect, url_for, session
from flask_login import LoginManager
import time
import os
import sys
import __future__
import mysql.connector
app = Flask(__name__, template_folder='templates')

db = mysql.connector.connect(user='root', password='what4k1ll3r', host='localhost', database='Cards')
cursor = db.cursor()


# def fillDatabase():
#     print("Loading the database...")
#     cursor.execute("SOURCE db.sql")

def queryDB(query):
    print(query)
    cursor.execute(query)
    if "delete" in query.lower() or "insert" in query.lower() or "update" in query.lower():
        db.commit()
    return cursor.fetchall()

@app.route('/home/<data>')
def home(data):
    # print(queryDB("Select * from creditcards"))
    if session.get('username') != data:
        return redirect(url_for('index'))
    else:
        query = "SELECT firstname, lastname, username, creditCardHolderId FROM Users WHERE username = '%s'" % (data)
        names = list(queryDB(query)[0])
        queryTwo = "SELECT * FROM CreditCards WHERE creditCardHolderId = %i" % (names[3])
        cards = list(queryDB(queryTwo))
        return render_template('index.html', firstname=names[0], lastname=names[1], username=names[2], cards=cards)

@app.route('/')
def index():
    cursor.execute("use Cards")
    return render_template('login.html')

@app.route('/addPage', methods=['POST'])
def addPage():
    return render_template('add.html')

@app.route('/add', methods=['POST'])
def addCard():
    cardid =queryDB("Select CreditCardHolderId from Users where username = '%s'" % (session.get('username')))
    cardid = cardid[0][0]
    query = "INSERT INTO creditCards (creditCardHolderId, creditCardNumber, creditCardName, creditCardExpirationDate, creditCardSecurityCode) VALUES (%i, '%s', '%s', '%s', '%s')" % (
        cardid, request.form.get('creditCardNum'), request.form.get('creditName'), request.form.get('expiration'), request.form.get('secCode'))
    queryDB(query)
    return redirect(url_for('home', data=session.get('username')))


@app.route('/delete/<number>', methods=['POST'])
def delete(number):
    cardid =queryDB("Select CreditCardHolderId from Users where username = '%s'" % (session.get('username')))
    cardid = cardid[0][0]
    queryDB("DELETE FROM CreditCards WHERE creditCardNumber = '%s' AND creditCardHolderId = '%s'" % (number, cardid))
    return redirect(url_for('home', data=session.get('username')))


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
            session.clear()
            session['username'] = list(loginResults[0])[4]
            return redirect(url_for("home", data=list(loginResults[0])[4]))
    else:
        return "Failed to login"


if __name__ == "__main__":
    app.secret_key = os.urandom(12)
    app.run(debug=True, host='0.0.0.0', port=3000)
