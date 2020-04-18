#!/bin/bash

set -x

TOMCAT_HOME=/Library/Tomcat

$TOMCAT_HOME/bin/shutdown.sh

export JAVA_OPTS="-Djava.net.preferIPv4Stack=true -Djava.net.preferIPv4Addressess=true -Djava.awt.headless=true -XX:+UseG1GC -Dfile.encoding=UTF-8 -XX:+UnlockExperimentalVMOptions -XX:MinRAMPercentage=50.0 -XX:MaxRAMPercentage=90.0"

rm -f $TOMCAT_HOME/logs

rm -rf $TOMCAT_HOME/webapps/ROOT
rm -f $TOMCAT_HOME/webapps/ROOT.war

# cp ~/projects/example-war/target/ROOT.war $TOMCAT_HOME/webapps/ROOT.war

# cp ~/Downloads/SampleWebApp.war $TOMCAT_HOME/webapps/ROOT.war

$TOMCAT_HOME/bin/startup.sh

tail -f $TOMCAT_HOME/logs/catalina.*.log
