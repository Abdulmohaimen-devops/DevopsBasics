#!/bin/bash

build_sha=$(cat /opt/shaBuild/shaBuild)
deploy_sha=$(cat /opt/shaDeploy)

if [ $build_sha = $deploy_sha ]
then
    echo Deployment successed, Go for testing
else
    echo Deployment failed, trigger build again
    aws codebuild start-build --project-name sha_project
fi