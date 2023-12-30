#!/bin/bash

automateNginxInstallation() {
    apt-get update &&  apt-get install -y nginx nginx-full nginx-extras curl 

    read -p "website domain: " domain

    # NGINX CONF
    cat << EOF > /etc/nginx/sites-available/default
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    server_name _;

    return 301 https://$domain$request_uri;
}

server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    server_name $domain;

    ssl_certificate /etc/ssl/<cloudlfare-cert-file>;
    ssl_certificate_key /etc/ssl/<cloudlfare-key-file>;

    # Add security headers
    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-XSS-Protection "1; mode=block" always;
    add_header Referrer-Policy "no-referrer-when-downgrade" always;
    add_header Content-Security-Policy "default-src 'self'; script-src 'self' 'unsafe-inline' 'unsafe-eval'; style-src 'self' 'unsafe-inline'; img-src 'self' data:; font-src 'self'; connect-src 'self'; object-src 'none'; base-uri 'self'; form-action 'self'; frame-ancestors 'self';" always;

    # Configure security parameters
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_prefer_server_ciphers on;
    ssl_ciphers "ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384";
    ssl_ecdh_curve secp384r1;
    ssl_session_timeout 10m;
    ssl_session_cache shared:SSL:10m;
    ssl_session_tickets off;
    ssl_stapling on;
    ssl_stapling_verify on;
    resolver 1.1.1.1 1.0.0.1 valid=300s;
    resolver_timeout 5s;

    # Nodejs reverse proxy
    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF

    ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default  &&  systemctl restart nginx
}

automateNodejsInstallation() {
    # Install Node.js
    sudo apt install -y nodejs npm && npm install npm@latest -g && npm cache clean -f && npm install -g n && sudo n stable &&  sudo n latest && node -v && npm -v
}

automateNginxInstallation
automateNodejsInstallation
