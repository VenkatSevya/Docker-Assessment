# Pull base image 
from ubuntu:latest
# Maintainer 
MAINTAINER "gopiperumalla14@gmail.com" 
COPY ./webapp/target/*.war /home/ubuntu/ansible
