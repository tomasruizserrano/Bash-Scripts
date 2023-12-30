#!/bin/bash

apt install nginx nginx-full nginx-extras curl

cd /etc/nginx && cp nginx.conf nginx.conf.backup

curl -o nginx.conf https://raw.githubusercontent.com/tomasruizserrano/Bash-Scripts/main/NGINX.CONF.PRESET/config/general.conf

mkdir config && cd config

curl -o general.conf https://raw.githubusercontent.com/tomasruizserrano/Bash-Scripts/main/NGINX.CONF.PRESET/config/general.conf
curl -o proxy.conf https://raw.githubusercontent.com/tomasruizserrano/Bash-Scripts/main/NGINX.CONF.PRESET/config/proxy.conf
curl -o security.conf https://raw.githubusercontent.com/tomasruizserrano/Bash-Scripts/main/NGINX.CONF.PRESET/config/security.conf

cd /etc/nginx/sites-enabled/

curl -o example.com.conf https://raw.githubusercontent.com/tomasruizserrano/Bash-Scripts/main/NGINX.CONF.PRESET/sites-enabled/example.com.conf

sudo ln -s /etc/nginx/sites-enabled/example.com.conf /etc/nginx/sites-avaiable/example.com.conf
