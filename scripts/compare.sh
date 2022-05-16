#!/bin/bash

cp target/SampleMavenTomcatApp.war /opt/
cp target/shaBuild /opt/

sha1sum   /opt/SampleMavenTomcatApp.war |  awk '{ print $1 }' > /opt/shaDeploy
sha1sum   /opt/SampleMavenTomcatApp.war |  awk '{ print $1 }'

build_sha=$(cat /opt/shaBuild)
deploy_sha=$(cat /opt/shaDeploy)

if [ $build_sha = $deploy_sha ]
then
    echo Deployment successed, Go for testing
else
    echo Deployment failed, trigger Pipeline again
    aws codepipeline start-pipeline-execution --name sha
fi
