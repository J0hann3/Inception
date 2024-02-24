FROM debian:bullseye

RUN apt-get -y update; \
	apt-get -y install nginx;
# 	apt install lsb-release ca-certificates apt-transport-https software-properties-common -y

# sudo mkdir -p /var/www/your_domain/html
# sudo chown -R $USER:$USER /var/www/your_domain/html
# sudo chmod -R 755 /var/www/your_domain
# nano /var/www/your_domain/html/index.html ->write page
# sudo nano /etc/nginx/sites-available/your_domain

# server {
#         listen 80;
#         listen [::]:80;

#         root /var/www/your_domain/html;
#         index index.html index.htm index.nginx-debian.html;

#         server_name your_domain www.your_domain;

#         location / {
#                 try_files $uri $uri/ =404;
#         }
# }
# sudo ln -s /etc/nginx/sites-available/your_domain /etc/nginx/sites-enabled/