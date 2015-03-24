#!/bin/bash
EXTENSION_DIR=`dirname "$0"`
cd $EXTENSION_DIR

ABSOLUTE_PATH=`pwd`

# start elk server
cd ${ABSOLUTE_PATH}/elkserver
make certs
sudo docker-compose start

# Copy certs
cd ${ABSOLUTE_PATH}
if [ ! -d ${ABSOLUTE_PATH}/appserver/logslash-forwarder/certs  ]; then \
	mkdir ${ABSOLUTE_PATH}/appserver/logslash-forwarder/certs; \
fi
cp -a ${ABSOLUTE_PATH}/elkserver/certs/* ${ABSOLUTE_PATH}/appserver/logslash-forwarder/certs/

# create logs data folder
mkdir -p /tmp/logs && touch /tmp/logs/test.log && touch /tmp/logs/nodejsapp.log

# start logslash forwarder
sudo ${ABSOLUTE_PATH}/appserver/logslash-forwarder/startcontainer.sh

# start nodejs app
sudo ${ABSOLUTE_PATH}/appserver/nodejs/startcontainer.sh