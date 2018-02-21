#!/bin/bash

#Debug port
export JAVA_OPTS='-Xdebug -Xrunjdwp:transport=dt_socket,address=8787,server=y,suspend=n -Djava.net.preferIPv4Stack=true'

###############################
# Connection Strings variables#
###############################

############################
# Jenkins REST API Project #
###########################
export JENKINS_REST_API_USERNAME=$JENKINS_REST_API_USERNAME
export JENKINS_REST_API_PASSWORD=$JENKINS_REST_API_PASSWORD
export JENKINS_IP=$JENKINS_IP

if [ -z "$JENKINS_REST_API_USERNAME" ]; 
then
    export JENKINS_REST_API_USERNAME="JENKINS_REST_API_USERNAME"
fi

if [ -z "$JENKINS_REST_API_PASSWORD" ]; 
then
    export JENKINS_REST_API_PASSWORD="JENKINS_REST_API_PASSWORD"
fi

if [ -z "$JENKINS_IP" ]; 
then
    export JENKINS_IP="JENKINS_IP"
fi


/opt/jboss/wildfly/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0
