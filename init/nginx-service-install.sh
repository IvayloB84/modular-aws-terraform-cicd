#!/bin/bash
sudo dnf install nginx -y
sudo systemctl enable --now nginx
sudo systemctl restart nginx 
sudo systemctl status nginx 