#!/bin/sh
sudo apt update
sudo apt install nginx -y
sudo rm -rf /var/www/html/*
sudo cp devops-practice-final-project/index.html /var/www/html/index.html
sudo cp devops-practice-final-project/nginx/conf/default /etc/nginx/sites-enabled/default
