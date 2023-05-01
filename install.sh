#!/bin/bash
echo "Installing dependencies from dnf..."
sudo dnf install mysql mysql-server python3.9
echo "dnf dependencies installed."
echo "making virtual environment..."
mkdir venv
python3.9 -m venv venv/
source venv/bin/activate
echo "Activated Virtual Environment."
echo "Installing pip dependencies..."
pip3 install -r requirements.txt
echo "All tasks complete."
echo "Run the app.py using python3 app.py"
