#!/bin/bash
EXTENSION_DIR=`dirname "$0"`
cd $EXTENSION_DIR

ABSOLUTE_PATH=`pwd`

# start elk server
#cd ${ABSOLUTE_PATH}/elkserver
#make certs
#sudo docker-compose up

# Copy certs
cd ${ABSOLUTE_PATH}
cp -a ${ABSOLUTE_PATH}/elkserver/certs ${ABSOLUTE_PATH}/appserver/logslash-forwarder/certs

# create logs data folder
mkdir -p /tmp/logs && touch /tmp/logs/test.log && touch /tmp/logs/nodejsapp.log

# start logslash forwarder
sudo ${ABSOLUTE_PATH}/appserver/logslash-forwarder/startcontainer.sh

# start nodejs app
