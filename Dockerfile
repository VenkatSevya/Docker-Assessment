# Pull base image 
from ubuntu:latest

# Maintainer 
MAINTAINER "gopiperumalla14@gmail.com" 
#COPY ./webapp.war /usr/local/tomcat/webapps
#RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
RUN cp -R /var/lib/jenkins/workspace/Docker Assessment/webapp/target/*.war /home/ubuntu/
