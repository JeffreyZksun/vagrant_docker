#!/bin/bash

# This script deploys the source code from local to /service/transervice on
# remote server.
#
# Get help from http://www.cyberciti.biz/tips/linux-use-rsync-transfer-mirror-files-directories.html
# --delete : delete files that don't exist on sender (system)
# -v : Verbose (try -vv for more detailed information)
# -e "ssh options" : specify the ssh as remote shell
# -a : archive mode
# -r : recurse into directories
# -z : compress file data

SRC=../
DEST=/service/transervice
USERNAME=ubuntu
SERVER=23.21.50.70

ssh $USERNAME@$SERVER 'sudo chown -R ubuntu:root /service'

rsync -avz --exclude=.git --exclude=node_modules --delete -e ssh $SRC $USERNAME@$SERVER:$DEST/

ssh $USERNAME@$SERVER 'sudo chown -R service:service /service'
ssh $USERNAME@$SERVER 'cd /service/transervice/deployment/ && sudo ./startcontainer.sh alpha'