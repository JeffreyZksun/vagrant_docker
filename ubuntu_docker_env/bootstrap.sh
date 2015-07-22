#!/usr/bin/env bash

# install docker, docker-compose, nodejs, git (built-in)

# Check that HTTPS transport is available to APT
if [ ! -e /usr/lib/apt/methods/https ]; then
	apt-get update
	apt-get install -y apt-transport-https
fi

###############################################################
# Install docker
###############################################################
# Add the repository to your APT sources
echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list
# Then import the repository key
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
apt-get update
apt-get install -y lxc-docker-1.5.0

###############################################################
# install docker-compose
###############################################################
curl -L https://github.com/docker/compose/releases/download/1.1.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

###############################################################
# Add user and group to run this service
###############################################################
useradd -mrU service

###############################################################
# Install nodejs
###############################################################
apt-get install -y wget
NODE_VER=v0.10.30
NODE_URL=http://nodejs.org/dist/${NODE_VER}/node-${NODE_VER}-linux-x64.tar.gz
wget -c ${NODE_URL} -O /tmp/node-${NODE_VER}-linux-x64.tar.gz
tar zxvf /tmp/node-${NODE_VER}-linux-x64.tar.gz
rm -f /tmp/node-${NODE_VER}-linux-x64.tar.gz
cp -rf node-${NODE_VER}-linux-x64/* /usr
rm -rf node-${NODE_VER}-linux-x64


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
