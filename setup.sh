#!/bin/sh
sudo apt update
sudo apt install nginx -y
sudo service nginx stop
sudo rm -rf /var/www/html/*

export INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-id)
export ETH0_MAC=$(ip -o link show dev eth0 | grep -Po 'ether \K[^ ]*')
export SUBNET_ID=$(TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` && curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/network/interfaces/macs/$ETH0_MAC/subnet-id)

echo "Hello from instance $INSTANCE_ID, running in subnet $SUBNET_ID" >> html/index.html

sudo cp html/* /var/www/html/
sudo cp nginx/conf/default /etc/nginx/sites-enabled/default
sudo service nginx start
sudo chmod +x update.sh
