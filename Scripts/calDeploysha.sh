#!/bin/bash

sha1sum  /server/target/server.jar |  awk '{ print $1 }' > ./server/target/shaDeploy
sha1sum  /server/target/server.jar |  awk '{ print $1 }' 
