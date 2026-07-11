#!/bin/bash

# export SITE_URL=""
# export EMAIL=""

## Install, enable and start on boot nginx web-server
# sudo dnf install nginx -y
# sudo systemctl enable --now nginx
# sudo systemctl start nginx 

## BACKUP your existing Nginx web-server configuration file nginx.conf
# sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak.`date +%F`
# grep -qxF '"\n\nserver {\n server_name ${SITE_URL}\n root         /usr/share/nginx/html;\n\n # Load configuration files for the default server block.\\n include /etc/nginx/default.d/*.conf;\n\n error_page 404 /404.html;\n location = /404.html { \n }\n\n error_page 500 502 503 504 /50x.html;\n location = /50x.html {\n }"' /etc/nginx/nginx.conf || echo -e "\n\nserver {\n server_name ${SITE_URL}\n root         /usr/share/nginx/html;\n\n # Load configuration files for the default server block.\\n include /etc/nginx/default.d/*.conf;\n\n error_page 404 /404.html;\n location = /404.html { \n }\n\n error_page 500 502 503 504 /50x.html;\n location = /50x.html {\n }" >> /etc/nginx/nginx.conf

## SSL/TSL Certificate setup for nginx web-server
# sudo dnf install python3 augeas-libs
# sudo python3 -m venv /opt/certbot/
# sudo /opt/certbot/bin/pip install --upgrade pip
# sudo /opt/certbot/bin/pip install certbot certbot-nginx
# sudo ln -s /opt/certbot/bin/certbot /usr/bin/certbot

## Search for 1st consequence and replace
# sudo sed -i '0,/server_name  _;/{s/server_name  _;/server_name  ${SITE_URL};/}' /etc/nginx/nginx.conf

## Install SSL certificate without human interaction
# sudo certbot run -n --nginx --agree-tos -d ${SITE_URL} -m ${EMAIL}  --redirect

## Set up automatic renewal check every Sunday of the month at 00:00 
# grep -qxF "0 0 * * Sun root /opt/certbot/bin/python -c 'import random; import time; time.sleep(random.random() * 3600)' && sudo certbot renew -q" /etc/crontab || echo "0 0 * * Sun root /opt/certbot/bin/python -c 'import random; import time; time.sleep(random.random() * 3600)' && sudo certbot renew -q" | sudo tee -a /etc/crontab > /dev/null


## To generate only the certificate without adding it to your nginx web-server configuration file you can comment out the below command
# sudo certbot certonly --nginx
