# tomcat-mac

## APR + SSL

vi $CATLINA_HOME/conf/server.xml

```xml
    <Connector port="8080" protocol="HTTP/1.1" connectionTimeout="20000" redirectPort="8443" />
          <UpgradeProtocol className="org.apache.coyote.http2.Http2Protocol"  connectionTimeout="-1" maxConnections="-1" maxConcurrentStreamExecution="1000" maxConcurrentStreams="1000" maxTrailerCount="-1" maxTrailerSize="-1" writeTimeout="-1" allowedTrailerHeaders="true"  compression="on" compressibleMimeType="text/html,text/xml,text/plain,text/css,text/javascript,application/javascript,application/json,application/xml" executorTerminationTimeoutMillis="600000"/>
        <SSLHostConfig protocols="TLSv1.3,TLSv1.2">
            <Certificate certificateKeyFile="conf/localhost.key" certificateFile="conf/localhost.crt" type="RSA" />
        </SSLHostConfig>
     </Connector>
```

vi $TOMCAT_HOME/conf/tomcat-users.xml

```xml
<user username="admin" password="admin" roles="manager-gui,admin-gui,admin-script,manager-script,manager-jmx,manager-status"/></tomcat-users>
```

```shell
$TOMCAT_HOME/bin/startup.sh
open http://localhost:8080/manager/html/list
```

```shell
cat $TOMCAT_HOME/logs/catalina.out
```

```log
...
INFO [main] org.apache.catalina.core.AprLifecycleListener.lifecycleEvent Loaded APR based Apache Tomcat Native library [1.2.23] using APR version [1.7.0].
INFO [main] org.apache.catalina.core.AprLifecycleListener.lifecycleEvent APR capabilities: IPv6 [true], sendfile [true], accept filters [false], random [true].
INFO [main] org.apache.catalina.core.AprLifecycleListener.lifecycleEvent APR/OpenSSL configuration: useAprConnector [false], useOpenSSL [true]
INFO [main] org.apache.catalina.core.AprLifecycleListener.initializeSSL OpenSSL successfully initialized [OpenSSL 1.1.1f  31 Mar 2020]
...
```

```shell
$TOMCAT_HOME/bin/shutdown.sh
```

## Links

[AprLifecycleListener]

[AprLifecycleListener]: https://tomcat.apache.org/tomcat-9.0-doc/config/listeners.html#APR_Lifecycle_Listener_-_org.apache.catalina.core.AprLifecycleListener

[Link]: https://github.com/kubernetes/examples/tree/master/staging/javaweb-tomcat-sidecar
