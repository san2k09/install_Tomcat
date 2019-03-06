FROM ubuntu:latest
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk wget
RUN mkdir -p /docker/tomcat
RUN wget http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.16/bin/apache-tomcat-9.0.16.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.16/* /docker/tomcat/
COPY sample1.war /docker/tomcat/webapps/
EXPOSE 8080
CMD /docker/tomcat/bin/catalina.sh run:wq!
