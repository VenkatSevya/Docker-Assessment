# Pull base image 
from tomcat:latest
# Maintainer 
LABEL MAINTAINER "gopiperumalla14@gmail.com"
COPY ./webapp/target/*.war /usr/local/tomcat/webapps/ 
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
