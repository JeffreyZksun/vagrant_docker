#!/bin/bash
EXTENSION_DIR=`dirname "$0"`
cd $EXTENSION_DIR
ABSOLUTE_PATH=`pwd`

cd ..
npm update
cd $ABSOLUTE_PATH
npm start
