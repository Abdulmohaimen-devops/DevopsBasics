#!/bin/bash

sha1sum  /opt/server.jar/server.jar |  awk '{ print $1 }' > /opt/shaDeploy
sha1sum  /opt/server.jar/server.jar |  awk '{ print $1 }'
