#!/bin/bash

## Update, install and enable Nginx web-server on startup 
# sudo dnf install nginx -y
# sudo systemctl start nginx 
# sudo systemctl enable --now nginx

## SSL/TSL Certificate setup for Nginx web-server
# sudo dnf install python3 augeas-libs
# sudo python3 -m venv /opt/certbot/
# sudo /opt/certbot/bin/pip install --upgrade pip
# sudo /opt/certbot/bin/pip install certbot certbot-nginx
# sudo ln -s /opt/certbot/bin/certbot /usr/bin/certbot

## Test and reload Nginx web-server after SSL certificate installation 
# nginx -t && nginx -s reload

## Set up automatic renewal check every month at 00:00 
#  echo "0 0 * * Sun root /opt/certbot/bin/python -c 'import random; import time; time.sleep(random.random() * 3600)' && sudo certbot renew -q" | sudo tee -a /etc/crontab > /dev/null
