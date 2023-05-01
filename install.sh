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
echo "Setting firewall permissions for port 3000..."
sudo firewall-cmd --zone=public --add-port=3000/tcp --permanent
sudo firewall-cmd --reload
echo "All tasks complete."
echo "Run the app.py using the following commands:"
echo "source venv/bin/activate"
echo "python3 app.py"
