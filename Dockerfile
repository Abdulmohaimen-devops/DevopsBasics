FROM tomcat
COPY SampleMavenTomcatApp.war /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]