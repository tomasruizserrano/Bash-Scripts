#!/bin/bash

apt install nginx nginx-full nginx-extras curl && mkdir /etc/nginx/config


curl -o /etc/nginx/nginx.conf https://raw.githubusercontent.com/tomasruizserrano/Bash-Scripts/main/NGINX.CONF.PRESET/nginx.conf


curl -o /etc/nginx/config/general.conf https://raw.githubusercontent.com/tomasruizserrano/Bash-Scripts/main/NGINX.CONF.PRESET/config/general.conf
curl -o /etc/nginx/config/proxy.conf https://raw.githubusercontent.com/tomasruizserrano/Bash-Scripts/main/NGINX.CONF.PRESET/config/proxy.conf
curl -o /etc/nginx/config/security.conf https://raw.githubusercontent.com/tomasruizserrano/Bash-Scripts/main/NGINX.CONF.PRESET/config/security.conf

cd /etc/nginx/sites-enabled/

curl -o /etc/nginx/sites-avaiable/example.com.conf https://raw.githubusercontent.com/tomasruizserrano/Bash-Scripts/main/NGINX.CONF.PRESET/sites-enabled/example.com.conf

sudo ln -s /etc/nginx/sites-avaiable/example.com.conf /etc/nginx/sites-enabled/example.com.conf 
