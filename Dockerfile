# Pull base image 
from ubuntu:latest
# Maintainer 
MAINTAINER "gopiperumalla14@gmail.com" 
RUN cp -R /var/lib/jenkins/workspace/DevOps Project/webapp/target /home/ubuntu/Ansible/webapp.war  --recursive
