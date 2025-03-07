server {
    listen 80;
    listen [::]:80;
    
    server_name alivenesslab.org www.alivenesslab.org;

    root /var/www/html/alivenesslab.org;
    index index.html index.htm;

    access_log /var/log/nginx/alivenesslab.org.access.log;
    error_log /var/log/nginx/alivenesslab.org.error.log;

    # Main location serving static files
    location / {
        root /var/www/html/alivenesslab.org/public;
        try_files $uri $uri/ =404;
    }

    # Proxy to backend services
    location /cnf {
        proxy_pass http://localhost:3006;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }

    location /emr {
        proxy_pass http://localhost:3006;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }

    location /a {
        proxy_pass http://localhost:3006;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
