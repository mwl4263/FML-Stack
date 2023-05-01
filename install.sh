#!/bin/bash

sudo dnf update
sudo dnf install mysql mysql-server python3.9
mkdir venv
python3.9 -m venv venv/
source venv/bin/activate
pip3 install -r requirements.txt
