server {
    server_name havisha.io www.havisha.io;

    root /var/www/html/havisha.io;
    index index.html index.htm;

    access_log /var/log/nginx/havisha.access.log;
    error_log /var/log/nginx/havisha.error.log;

     # Main location serving static files
    location / {
        root /var/www/html/havisha.io/public;
        try_files $uri $uri/ =404;
    }


    location /cnf {
        proxy_pass http://localhost:3005;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }

    #  End Points for email search
    location /emr {
        proxy_pass http://localhost:3004;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
    #  End Points for user reg and login
    location /a {
        proxy_pass http://localhost:3004;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }

    listen [::]:443 ssl; # managed by Certbot
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/havisha.io/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/havisha.io/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot


}
server {
    if ($host = www.havisha.io) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    if ($host = havisha.io) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    listen [::]:80;
    server_name havisha.io www.havisha.io;
    return 404; # managed by Certbot




}