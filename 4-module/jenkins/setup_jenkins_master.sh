#!/bin/bash

amazon-linux-extras install java-openjdk11 -y
wget -O /etc/yum.repos.d/jenkins.repo  https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum install jenkins git docker -y
systemctl enable --now  jenkins
usermod -a -G docker jenkins
curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.23.13/2022-10-31/bin/linux/amd64/kubectl --output-dir /usr/bin/
chmod +x /usr/bin/kubectl
systemctl restart docker
systemctl enable docker
