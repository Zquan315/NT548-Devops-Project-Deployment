#!/bin/bash 
mkdir /home/ubuntu/student-management-app 
sudo chown -R ubuntu:ubuntu /home/ubuntu/student-management-app 
sudo chmod -R 777 /home/ubuntu/student-management-app
sudo apt update -y 
sudo apt install -y ruby wget 
cd /home/ubuntu 
wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install 
chmod +x ./install 
sudo ./install auto 