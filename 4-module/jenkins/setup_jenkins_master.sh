#!/bin/bash

amazon-linux-extras install java-openjdk11 -y

wget -O /etc/yum.repos.d/jenkins.repo  https://pkg.jenkins.io/redhat-stable/jenkins.repo

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

yum install jenkins -y

systemctl enable --now  jenkins

