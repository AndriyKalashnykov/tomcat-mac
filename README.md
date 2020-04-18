# tomcat-mac

## useAprConnector

https://tomcat.apache.org/tomcat-9.0-doc/config/listeners.html#APR_Lifecycle_Listener_-_org.apache.catalina.core.AprLifecycleListener

## APR + SSL

https://confluence.eng.vmware.com/pages/viewpage.action?pageId=374637441


vi $CATLINA_HOME/conf/server.xml

<Connector port="8443" connectionTimeout="20000" protocol="org.apache.coyote.http11.Http11AprProtocol" maxThreads="150" SSLEnabled="true" SSLProtocol="TLSv1.2" secure="true" SSLEngine="on">
    <UpgradeProtocol className="org.apache.coyote.http2.Http2Protocol" compressibleMimeType="text/html,text/xml,text/plain,text/css,text/javascript,text/json,application/x-javascript, application/javascript,application/json" compression="force" userSendfile="false"/>
    <SSLHostConfig>
        <Certificate certificateKeyFile="conf/localhost.key" certificateFile="conf/localhost.crt" type="RSA" />
    </SSLHostConfig>
</Connector>

<Connector port="80" protocol="HTTP/1.1" enableLookups="false" redirectPort="443"/>
<Connector port="443" protocol="org.apache.coyote.http11.Http11AprProtocol" SSLEnabled="true" maxThreads="300" connectionTimeout="-1" maxConnections="-1" executorTerminationTimeoutMillis="600000">
       <UpgradeProtocol className="org.apache.coyote.http2.Http2Protocol"  connectionTimeout="-1" maxConnections="-1" maxConcurrentStreamExecution="1000" maxConcurrentStreams="1000" maxTrailerCount="-1" maxTrailerSize="-1" writeTimeout="-1" allowedTrailerHeaders="true"  compression="on" compressibleMimeType="text/html,text/xml,text/plain,text/css,text/javascript,application/javascript,application/json,application/xml" executorTerminationTimeoutMillis="600000"/>
        <SSLHostConfig>
            <Certificate certificateKeyFile="conf/localhost.key" certificateFile="conf/localhost.crt" type="RSA" />
        </SSLHostConfig>
</Connector>

$TOMCAT_HOME/bin/startup.sh

vi $TOMCAT_HOME/conf/tomcat-users.xml
# insert following rows
# <role rolename="manager-gui"/>
# <user username="admin" password="admin" roles="manager-gui"/>
cat $TOMCAT_HOME/conf/tomcat-users.xml

open http://localhost:8080/manager/html/list

$TOMCAT_HOME/bin/shutdown.sh

# Links 
# https://github.com/kubernetes/examples/tree/master/staging/javaweb-tomcat-sidecar