# Pull base image 
from ubuntu:latest
# Maintainer 
MAINTAINER "gopiperumalla14@gmail.com" 
RUN cp -R /var/lib/jenkins/workspace/Docker Assessment/webapp/target/*.war /home/ubuntu/webapp.war
