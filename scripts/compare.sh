#!/bin/bash

#### Incase of failure #### 
sha1sum   /etc/host.conf |  awk '{ print $1 }' > /opt/shaDeploy

# sha1sum   /opt/SampleMavenTomcatApp.war |  awk '{ print $1 }' > /opt/shaDeploy

build_sha=$(cat /opt/shaBuild)
deploy_sha=$(cat /opt/shaDeploy)

if [ $build_sha = $deploy_sha ]
then
    echo Deployment successed, Go for testing
else
    echo Deployment failed, trigger Pipeline again
    echo ShaValues are not identical 
    apt install awscli
    aws codepipeline start-pipeline-execution --name SHA-Pipline --region us-west-2
    exit 1
fi
