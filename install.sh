#!/bin/bash
sudo yum update -y
sudo yum install git -y
cd Project-Management/backend
git pull
pip3 install -r requirements.txt
nohup python3 backend.py </dev/null &>/dev/null &

