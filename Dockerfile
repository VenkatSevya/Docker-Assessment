# Pull base image 
from ubuntu:latest

# Maintainer 
MAINTAINER "gopiperumalla14@gmail.com" 
#COPY ./webapp.war /usr/local/tomcat/webapps
#RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
RUN aws s3 cp s3://s3.new/webapp/target/webapp.war /home/ubuntu/webapp.war --recursive
