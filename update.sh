#!/bin/sh
mkdir temp-dir
git clone https://github.com/Leksandrua/devops-practice-final-project.git temp-dir/
sudo rm -rf /var/www/html/*

export INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance->
export ETH0_MAC=$(ip -o link show dev eth0 | grep -Po 'ether \K[^ ]*')
export SUBNET_ID=$(TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl->

echo "Hello from instance $INSTANCE_ID, running in subnet $SUBNET_ID" > html/index.html

sudo cp temp-dir/html/* /var/www/html/
sudo cp temp-dir/nginx/conf/default /etc/nginx/sites-enabled/default
sudo rm -rf temp-dir
sudo service nginx start
