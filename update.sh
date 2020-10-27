#!/bin/sh
sudo apt update
sudo apt install nginx -y
sudo service nginx stop
sudo rm -rf /var/www/html/*
sudo cp devops-practice-final-project/html/* /var/www/html/*
sudo cp devops-practice-final-project/nginx/conf/default /etc/nginx/sites-enabled/default
sudo service nginx start

mkdir temp-dir
git clone https://github.com/Leksandrua/devops-practice-final-project.git temp-dir/
sudo rm -rf /var/www/html/*
sudo cp temp-dir/devops-practice-final-project/html/* /var/www/html/*
sudo cp temp-dir/devops-practice-final-project/nginx/conf/default /etc/nginx/sites-enabled/default
sudo rm -rf temp-dir
sudo service nginx start
