# Pull base image 
from ubuntu:latest
# Maintainer 
MAINTAINER "narayana.vr6@gmail.com" 
RUN cp -R /var/lib/jenkins/workspace/Docker Assessment/webapp/target/*.war /home/ubuntu/webapp.war
