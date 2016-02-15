#!/usr/bin/env bash

# install docker, docker-compose, nodejs, git (built-in)

if [ ! -d /var/bootstrap ]; then
    #save the installation log to this folder to avoid the duplicate execution
    mkdir -p /var/bootstrap
fi

if [ ! -f /var/bootstrap/aptupdate ]; then
    apt-get update
    touch /var/bootstrap/aptupdate
fi

# Check that HTTPS transport is available to APT
if [ ! -e /usr/lib/apt/methods/https ]; then
	apt-get install -y apt-transport-https
fi

###############################################################
# Install docker
###############################################################
if [ ! -f /var/bootstrap/docker ]; then
	curl -sSL https://get.docker.com/ | sh

	# Add the repository to your APT sources
	# echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list
	# # Then import the repository key
	# apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
	# apt-get update
	# apt-get install -y lxc-docker-1.5.0

    touch /var/bootstrap/docker
fi

###############################################################
# install docker-compose
###############################################################
DOCKER_COMPOSE_VERSION=1.6.0

if [ ! -f /var/bootstrap/docker-compose ]; then
	#refer: https://docs.docker.com/compose/install/
	#curl -L https://github.com/docker/compose/releases/download/1.1.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
	curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
    
    touch /var/bootstrap/docker-compose
fi

###############################################################
# Add user and group to run this service
###############################################################

if id -u "service" >/dev/null 2>&1; then
    echo ""
else
    # "user does not exist"
    useradd -mrU service
fi

###############################################################
# Install nodejs
###############################################################

if [ ! -f /var/bootstrap/node-v5.6.0 ]; then
	apt-get install -y wget
	NODE_VER=v5.6.0
	NODE_URL=http://nodejs.org/dist/${NODE_VER}/node-${NODE_VER}-linux-x64.tar.gz
	wget -c ${NODE_URL} -O /tmp/node-${NODE_VER}-linux-x64.tar.gz
	tar zxvf /tmp/node-${NODE_VER}-linux-x64.tar.gz
	rm -f /tmp/node-${NODE_VER}-linux-x64.tar.gz
	cp -rf node-${NODE_VER}-linux-x64/* /usr
	rm -rf node-${NODE_VER}-linux-x64

    touch /var/bootstrap/node-v5.6.0
fi

###############################################################
# create /service, /log, /data
###############################################################
if [ ! -d /service ]; then 
    mkdir -p /service && chown -R service:service /service
fi

if [ ! -d /data ]; then 
    mkdir -p /data && chown -R service:service /data
fi

if [ ! -d /log ]; then 
    mkdir -p /log && chown -R service:service /log
fi


###############################################################
# Util funcitons
###############################################################

# 1-not exist, 2-running, 3-stop, 4-paused
function getContainerStatus {
    local CONTAINER=$1
    local status=1
    local RUNNING=$(docker inspect --format="{{ .State.Running }}" $CONTAINER 2> /dev/null)

    if [ "$RUNNING" == "false" ]; then
    # "$CONTAINER is not running."
    status=3
    fi

    if [ "$RUNNING" == "true" ]; then
        local PAUSED=$(docker inspect --format="{{ .State.Paused }}" $CONTAINER)
        if [ "$PAUSED" == "true" ]; then
        # "WARNING - $CONTAINER has been paused."
        status=4
        else
        status=2
        fi
    fi

    echo $status
}

###############################################################
# start docker ui for monitor purpose
###############################################################

status=$(getContainerStatus dockerui)
case "$status" in
1) docker run --name=dockerui -d -p 9000:9000 --restart=always --privileged -v /var/run/docker.sock:/var/run/docker.sock dockerui/dockerui
    ;;
    # restart nginx after the /vagrant folder is mounted
3)  docker start dockerui
    ;;
*) echo "dockerui is running"
   ;;
esac

###############################################################
# Print success message
###############################################################
echo [SUCCESS] visit the page for docker status http://localhost:9000
