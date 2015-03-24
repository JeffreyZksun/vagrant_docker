#!/bin/bash
EXTENSION_DIR=`dirname "$0"`
cd $EXTENSION_DIR

ABSOLUTE_PATH=`pwd`

# start elk server
cd ${ABSOLUTE_PATH}/elkserver
make certs

# Copy certs
cd ${ABSOLUTE_PATH}
if [ ! -d ${ABSOLUTE_PATH}/appserver/logslash-forwarder/certs  ]; then \
	mkdir ${ABSOLUTE_PATH}/appserver/logslash-forwarder/certs; \
fi
cp -a ${ABSOLUTE_PATH}/elkserver/certs/* ${ABSOLUTE_PATH}/appserver/logslash-forwarder/certs/

# create logs data folder
mkdir -p /tmp/logs && touch /tmp/logs/test.log && touch /tmp/logs/nodejsapp.log

# build logslash forwarder
sudo ${ABSOLUTE_PATH}/appserver/logslash-forwarder/buildimage.sh

# build nodejs app
sudo ${ABSOLUTE_PATH}/appserver/nodejs/buildimage.sh

# build and start elk
cd ${ABSOLUTE_PATH}/elkserver
sudo docker-compose up &

# build and start server
cd ${ABSOLUTE_PATH}/appserver
sudo docker-compose up &

cd ${ABSOLUTE_PATH}