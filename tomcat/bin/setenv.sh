#!/bin/bash
 
export CATALINA_OPTS="$CATALINA_OPTS -Djava.library.path=/usr/local/opt/tomcat-native/lib"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/opt/tomcat-native/lib"