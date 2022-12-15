# Pull base image 
from tomcat:latest
# Maintainer 
LABEL MAINTAINER "gopiperumalla14@gmail.com"
COPY ./webapp/target/*.war /opt/apache-tomcat-10.0.27/webapps 
EXPOSE 8080
CMD ["/opt/apache-tomcat-10.0.27/bin/catalina.sh", "run"]
