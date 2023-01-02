FROM tomcat
MAINTAINER akshaysaini193@gmail.com
RUN mkdir -p /home/akshay
WORKDIR /home/akshay
ADD target/spring-boot-hello-1.0.jar /usr/local/tomcat/webapps/

RUN echo 'java -Dserver.port=8888 -jar spring-boot-hello-1.0.jar' >> /home/akshay/start.sh && \
    chmod 755 /home/akshay/start.sh

EXPOSE 8888

CMD /home/akshay/start.sh
