# Pull base image 
from ubuntu:latest
# Maintainer 
MAINTAINER "narayana.vr6@gmail.com" 
RUN cp -R /var/lib/jenkins/workspace/DevOps Project/webapp/target/*.war /home/ubuntu/Ansible/webapp.war
