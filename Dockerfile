# Pull base image 
from ubuntu:latest
# Maintainer 
LABEL MAINTAINER "narayana.vr6@gmail.com"
RUN apt-get update
RUN cp -R /var/lib/jenkins/workspace/Docker Assessment/webapp/target/*.war /home/ubuntu/webapp.war
