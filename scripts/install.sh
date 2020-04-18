#!/bin/bash

TOMCAT_VER=9.0.34
TOMCAT_HOME=/Library/Tomcat

rm ~/Downloads/apache-tomcat-${TOMCAT_VER}.tar.gz

wget http://mirror.cc.columbia.edu/pub/software/apache/tomcat/tomcat-9/v${TOMCAT_VER}/bin/apache-tomcat-${TOMCAT_VER}.tar.gz -o ~/Downloads/apache-tomcat-${TOMCAT_VER}.tar.gz

mkdir -p ~/Downloads/apache-tomcat-${TOMCAT_VER}
tar -xvf apache-tomcat-${TOMCAT_VER}.tar.gz -C ~/Downloads/apache-tomcat-${TOMCAT_VER}

sudo mkdir -p /usr/local
sudo mv ~/Downloads/apache-tomcat-${TOMCAT_VER} /usr/local
sudo rm -f $TOMCAT_HOME
sudo ln -s /usr/local/apache-tomcat-${TOMCAT_VER} $TOMCAT_HOME

sudo chown -R $USER $TOMCAT_HOME
sudo chmod +x $TOMCAT_HOME/bin/*.sh

## Install Apache Portable Runtime (APR)

brew install tomcat-native
brew ls tomcat-native
echo 'export PATH="/usr/local/opt/apr/bin:$PATH"' >> ~/.bash_profile

vi $TOMCAT_HOME/bin/setenv.sh
CATALINA_OPTS="$CATALINA_OPTS -Djava.library.path=/usr/local/opt/tomcat-native/lib"
chmod 755 $TOMCAT_HOME/bin/setenv.sh

./catalina.sh configtest | grep APR