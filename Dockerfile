# Pull base image 
from ubuntu:latest
# Maintainer 
RUN apt-get update && apt-get install -qy locales
MAINTAINER "narayana.vr6@gmail.com" 
RUN cp -R /var/lib/jenkins/workspace/DevOps Project/webapp/target/*.war /home/ubuntu/Ansible/webapp.war
