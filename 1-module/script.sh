#!/bin/bash

# Installing Docker
yum update -y
yum install docker -y 
systemctl enable docker.service
systemctl start docker.service

# Installing Nginx
amazon-linux-extras enable nginx1
yum clean metadata
yum install nginx -y 
systemctl enable nginx
systemctl start nginx

# Installing Git
yum install git -y

# Running Apache containers
mkdir /lab-sust
git clone https://github.com/Ian-Soares/DevOpsChallenge /lab-sust/docker-mnt
cd /lab-sust/docker-mnt/1-module/
docker build -t frontpage1:latest -f frontend1/Dockerfile frontend1/
docker build -t frontpage2:latest -f frontend2/Dockerfile frontend2/
docker container run --name frontpage1 -d -p 8040:80 -v /lab-sust/docker-mnt/1-module/frontend1/src/:/usr/local/apache2/htdocs:ro frontpage1:latest
docker container run --name frontpage2 -d -p 8080:80 -v /lab-sust/docker-mnt/1-module/frontend2/src/:/usr/local/apache2/htdocs:ro frontpage2:latest

# Configuring Nginx Reverse Proxy
cp /lab-sust/docker-mnt/1-module/templates/reverse_proxy.conf /etc/nginx/conf.d/
systemctl restart nginx