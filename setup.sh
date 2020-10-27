#!/bin/sh
sudo apt update
sudo apt install nginx -y
sudo service nginx stop
sudo rm -rf /var/www/html/*
sudo cp devops-practice-final-project/html/* /var/www/html/*
sudo cp devops-practice-final-project/nginx/conf/default /etc/nginx/sites-enabled/default
sudo service nginx start
