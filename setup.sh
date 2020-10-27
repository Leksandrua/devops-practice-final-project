#!/bin/sh
sudo apt update
sudo apt install nginx -y
sudo service nginx stop
sudo rm -rf /var/www/html/*
sudo cp html/* /var/www/html/
sudo cp nginx/conf/default /etc/nginx/sites-enabled/default
sudo service nginx start
sudo chmod +x update.sh
