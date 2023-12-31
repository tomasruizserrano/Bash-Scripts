#!/bin/bash
mkdir /etc/nginx/config
apt install nginx nginx-full nginx-extras curl

openssl dhparam -out /etc/nginx/dhparam.pem 2048

curl -o /etc/nginx/nginx.conf https://raw.githubusercontent.com/tomasruizserrano/Bash-Scripts/main/NGINX.CONF.PRESET/nginx.conf
curl -o /etc/nginx/config/general.conf https://raw.githubusercontent.com/tomasruizserrano/Bash-Scripts/main/NGINX.CONF.PRESET/config/general.conf
curl -o /etc/nginx/config/proxy.conf https://raw.githubusercontent.com/tomasruizserrano/Bash-Scripts/main/NGINX.CONF.PRESET/config/proxy.conf
curl -o /etc/nginx/config/security.conf https://raw.githubusercontent.com/tomasruizserrano/Bash-Scripts/main/NGINX.CONF.PRESET/config/security.conf
curl -o /etc/nginx/sites-available/example.com.conf https://raw.githubusercontent.com/tomasruizserrano/Bash-Scripts/main/NGINX.CONF.PRESET/sites-enabled/example.com.conf
sudo ln -s /etc/nginx/sites-available/example.com.conf /etc/nginx/sites-enabled/example.com.conf 
