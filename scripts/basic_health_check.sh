#!/bin/bash

for i in `seq 1 10`;
do
  HTTP_CODE=`curl --write-out '%{http_code}' -o /dev/null -m 10 -q -s http://localhost:80/Hello/`
  if [ "$HTTP_CODE" == "200" ]; then
    echo "Successfully pulled root page."
    rm -rf /opt/SampleMavenTomcatApp.war
    rm -rf /opt/shaBuild
    rm -rf /opt/shaDeploy
    rm -rf /opt/Dockerfile
    rm -rf /opt/Hello.war
    exit 0;
  fi
  echo "Attempt to curl endpoint returned HTTP Code $HTTP_CODE. Backing off and retrying."
  sleep 10
done
echo "Server did not come up after expected time. Failing."
exit 1

