# Pull base image 
from ubuntu:latest
# Maintainer 
MAINTAINER "gopiperumalla14@gmail.com" 
RUN cp -R s3://s3.new/webapp/target/webapp.war /home/ubuntu/webapp.war  --recursive
