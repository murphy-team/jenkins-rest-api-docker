FROM jboss/wildfly:10.1.0.Final

#Set user admin by default
RUN /opt/jboss/wildfly/bin/add-user.sh admin 12345 --silent

#Delete default standalone configuration
RUN rm /opt/jboss/wildfly/standalone/configuration/standalone.xml

#Set custom standalone configuration
COPY ./standalone.xml /opt/jboss/wildfly/standalone/configuration/

#Copy custom run script
COPY ./run_standalone.sh /opt/jboss/wildfly/bin/

COPY ./config.xml /opt/jboss/wildfly/docs/

# Copy files from files_to_container to container folder
COPY files_to_container/. /opt/jboss/wildfly/standalone/deployments

RUN whoami

#Change default image TimeZone
USER root

ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

USER jboss

CMD ["/opt/jboss/wildfly/bin/run_standalone.sh"]
