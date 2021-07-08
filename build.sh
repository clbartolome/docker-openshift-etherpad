#!/bin/bash
export VERSION=1.8.14
docker build . -t quay.io/gpte-devops-automation/etherpad:${VERSION}
docker tag quay.io/gpte-devops-automation/etherpad:${VERSION} quay.io/gpte-devops-automation/etherpad:latest
docker push quay.io/gpte-devops-automation/etherpad:${VERSION}
docker push quay.io/gpte-devops-automation/etherpad:latest
#git tag ${VERSION}
#git push origin ${VERSION}
