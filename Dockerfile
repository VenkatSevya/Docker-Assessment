# Pull base image 
from ubuntu:latest
# Maintainer 
MAINTAINER "gopiperumalla14@gmail.com" 
RUN aws s3 sync ://s3.new/webapp/target/webapp.war /home/ubuntu/webapp.war  --recursive
