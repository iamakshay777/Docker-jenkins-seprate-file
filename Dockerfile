FROM tomcat
MAINTAINER akshaysaini193@gmail.com
RUN mkdir -p /home/akshay
WORKDIR /home/akshay
COPY . /usr/local/tomcat/webapps/
ADD target/spring-boot-hello-1.0.jar /usr/local/tomcat/webapps/

RUN echo 'java -Dserver.port=8888 -jar spring-boot-hello-1.0.jar' > /usr/local/tomcat/webapps/start.sh && \
    chmod 755 /usr/local/tomcat/webapps/start.sh

EXPOSE 8888

CMD ["sh","/usr/local/tomcat/webapps/start.sh"]
