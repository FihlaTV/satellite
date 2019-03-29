#!/bin/sh

export eTAG="latest"
echo $1
if [ $1 ] ; then
  eTAG=$1
fi

docker rm -f satellite

Version=$(git describe --tags --dirty)
GitCommit=$(git rev-parse HEAD)


echo Building s8sg/satellite:$eTAG

docker build --build-arg VERSION=$Version --build-arg GIT_COMMIT=$GitCommit -t s8sg/satellite:$eTAG . -f Dockerfile.redist && \
 docker create --name satellite s8sg/satellite:$eTAG && mkdir bin && \
 docker cp satellite:/root/satellite ./bin/ && \
 docker cp satellite:/root/satellite-darwin ./bin/ && \
 docker cp satellite:/root/satellite-armhf ./bin/ && \
 docker cp satellite:/root/satellite-arm64 ./bin/ && \
 docker rm -f satellite
