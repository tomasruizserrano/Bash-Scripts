#!/bin/bash

# Function to automate nginx installation and configuration
automateNginxInstallation() {
    # Install nginx
    apt-get update
    apt-get install -y nginx nginx-full nginx-extras

    read -p "website domain: " domain

    # Configure nginx with SSL
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
    ssl_ciphers "TLS_AES_256_GCM_SHA384:TLS_CHACHA20_POLY1305_SHA256:TLS_AES_128_GCM_SHA256";
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

    # Enable the nginx configuration
    ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

    # Restart nginx
    systemctl restart nginx
}

# Function to automate Node.js installation

automateNodejsInstallation() {
    # Install Node.js
    curl -sL https://deb.nodesource.com/setup_21.x | bash -
    apt-get install -y nodejs

    # Verify Node.js installation
    node -v
    npm -v
}

automateNginxInstallation
automateNodejsInstallation
