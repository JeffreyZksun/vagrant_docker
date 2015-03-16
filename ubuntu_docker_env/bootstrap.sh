#!/usr/bin/env bash

# 1
#apt-get update
#apt-get install docker.io -y

# 2
# install docker
#curl -sSL https://get.docker.com/ubuntu/ | sudo sh

#3
# install docker 
#curl -sSL -O https://get.docker.com/builds/Linux/x86_64/docker-1.5.0 && chmod +x docker-1.5.0 && sudo mv docker-1.5.0 /usr/local/bin/docker
# Then start docker in daemon mode:
#sudo /usr/local/bin/docker -d

#4
# Check that HTTPS transport is available to APT
if [ ! -e /usr/lib/apt/methods/https ]; then
	apt-get update
	apt-get install -y apt-transport-https
fi

# Add the repository to your APT sources
echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list

# Then import the repository key
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

# Install docker
apt-get update
apt-get install -y lxc-docker-1.5.0

#
# Alternatively, just use the curl-able install.sh script provided at https://get.docker.com
#

# install docker-compose
curl -L https://github.com/docker/compose/releases/download/1.1.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose


