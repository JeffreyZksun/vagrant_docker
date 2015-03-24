#!/bin/bash
EXTENSION_DIR=`dirname "$0"`
cd $EXTENSION_DIR

ABSOLUTE_PATH=`pwd`

# Copy certs
cd ${ABSOLUTE_PATH}
if [ ! -d ${ABSOLUTE_PATH}/appserver/logslash-forwarder/certs  ]; then \
	mkdir ${ABSOLUTE_PATH}/appserver/logslash-forwarder/certs; \
fi
cp -a ${ABSOLUTE_PATH}/elkserver/certs/* ${ABSOLUTE_PATH}/appserver/logslash-forwarder/certs/


# start logslash forwarder
cd ${ABSOLUTE_PATH}/elkserver
sudo docker-compose start

# start nodejs app
cd ${ABSOLUTE_PATH}/appserver
sudo docker-compose start