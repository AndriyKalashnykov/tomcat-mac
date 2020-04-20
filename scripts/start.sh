#!/bin/bash

set -x

source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk use java 8.0.232.hs-adpt

TOMCAT_HOME=/Library/Tomcat

export JAVA_OPTS="-Djava.net.preferIPv4Stack=true -Djava.net.preferIPv4Addressess=true -Djava.awt.headless=true -XX:+UseG1GC -Dfile.encoding=UTF-8 -XX:+UnlockExperimentalVMOptions -XX:MinRAMPercentage=50.0 -XX:MaxRAMPercentage=90.0"

rm -rf $TOMCAT_HOME/webapps/ROOT
rm -f $TOMCAT_HOME/webapps/ROOT.war

cd ~/projects/tomcat-root-war/
mvn clean install -DskipUiTests -Dmaven.test.skip=true
cp ~/projects/tomcat-root-war/target/ROOT.war $TOMCAT_HOME/webapps

# wget https://github.com/AndriyKalashnykov/tomcat-root-war/releases/download/1.0.0/ROOT.war
# mv ROOT.war $TOMCAT_HOME/webapps

rm -f $TOMCAT_HOME/logs/*.*

$TOMCAT_HOME/bin/startup.sh

cat $TOMCAT_HOME/logs/catalina.out
while ! tail -f $TOMCAT_HOME/logs/catalina.out; do sleep 1 ; done