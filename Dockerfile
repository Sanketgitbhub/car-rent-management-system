FROM tomcat:9.0

RUN rm -rf /usr/local/tomcat/webapps/*

COPY finalproject/rent/src/main/webapp/ /usr/local/tomcat/webapps/ROOT/
COPY finalproject/rent/build/classes/ /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/

EXPOSE 8080

CMD ["catalina.sh", "run"]
