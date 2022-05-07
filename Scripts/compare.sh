#!/bin/bash

sha1sum  /opt/server.jar |  awk '{ print $1 }' > /opt/shaDeploy
sha1sum  /opt/server.jar |  awk '{ print $1 }' 

build_sha=$(cat /opt/shaBuild)
deploy_sha=$(cat /opt/shaDeploy)

if [ $build_sha = $deploy_sha ]
then
    echo Deployment successed, Go for testing
else
    echo Deployment failed, trigger build again
    aws codepipeline 
fi