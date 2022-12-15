# Pull base image 
from ubuntu:22.04
# Maintainer 
LABEL MAINTAINER "gopiperumalla14@gmail.com"
RUN apt-get update
RUN cp -R /var/lib/jenkins/workspace/Docker Assessment/webapp/target/*.war /home/ubuntu/webapp.war
