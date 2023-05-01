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
echo "enabling and starting mysqld..."
sudo systemctl start mysqld
sudo systemctl enable mysqld
echo "All tasks complete."
echo "Follow these steps to run the app:"
echo "1. Make sure you have ran mysql_secure_installation and use password 'whatever' for the root user (all other options can be skipped by pressing the return key)."
echo "2. 'Source db.sql' after running 'mysql -u root -p'"
echo "3. source venv/bin/activate"
echo "4. python3 app.py"
