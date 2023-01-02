FROM tomcat
MAINTAINER akshaysaini193@gmail.com
RUN mkdir -p /home/akshay
WORKDIR /home/akshay
COPY . /usr/local/tomcat/webapps/
ADD target/spring-boot-hello-1.0.jar /usr/local/tomcat/webapps/
EXPOSE 8888
ENTRYPOINT ["/usr/local/tomcat/webapps/"]
CMD ["java -Dserver.port=8888 -jar spring-boot-hello-1.0.jar"]
