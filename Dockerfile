FROM tomcat
COPY /opt/SampleMavenTomcatApp.war /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]