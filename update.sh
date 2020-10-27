#!/bin/sh
mkdir temp-dir
git clone https://github.com/Leksandrua/devops-practice-final-project.git temp-dir/
sudo rm -rf /var/www/html/*
sudo cp temp-dir/html/* /var/www/html/
sudo cp temp-dir/nginx/conf/default /etc/nginx/sites-enabled/default
sudo rm -rf temp-dir
sudo service nginx start
