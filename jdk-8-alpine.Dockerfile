# A open jdk 8 with alpine linux
FROM alpine:3.8

RUN mkdir -p /opt/tomcat
#Add the musl-based jdk8 distribution
RUN apk update
RUN apk upgrade
RUN apk add openjdk8
RUN apk add bash

#wget http://apache.mirror.cdnetworks.com/tomcat/tomcat-9/v9.0.10/bin/apache-tomcat-9.0.10.tar.gz
add apache-tomcat-9.0.10.tar.gz  /opt/tomcat

#ENV
ENV NAME tomcat9-alpine-linux
ENV TOMCAT_HOME=/opt/tomcat/apache-tomcat-9.0.10
ENV PATH=$PATH:$TOMCAT_HOME/bin

#EXPOSE 8080 DEFAULT TOMCAT PORT
EXPOSE 8080

WORKDIR /opt/tomcat/apache-tomcat-9.0.10/bin

#CMD
#CMD ["catalina.sh","run"]
ENTRYPOINT ["catalina.sh","run"]
