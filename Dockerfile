FROM tomcat:8.0.53-jre8-alpine
MAINTAINER konraifen88

# ENV SPRING_PROFILES_ACTIVE default,postgresql
#ENV UAA_URL http://@app@.@appdomain@
#ENV LOGIN_URL http://@app@.@appdomain@

ADD dev.yml /uaa/uaa.yml
ENV UAA_CONFIG_FILE /uaa/uaa.yml

ADD uaa-additional.yml /uaa/additional.yml
ENV LOGIN_CONFIG_URL=file:///uaa/additional.yml

RUN rm -rf /usr/local/tomcat/webapps/*

ADD cloudfoundry-identity-uaa-4.20.0.war /usr/local/tomcat/webapps/
RUN mv /usr/local/tomcat/webapps/cloudfoundry-identity-uaa-4.20.0.war /usr/local/tomcat/webapps/ROOT.war


EXPOSE 8080

CMD ["catalina.sh", "run"]
