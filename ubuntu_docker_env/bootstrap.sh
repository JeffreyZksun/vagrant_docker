#!/usr/bin/env bash

apt-get update
apt-get install docker.io -y

# install docker
#curl -sSL https://get.docker.com/ubuntu/ | sudo sh

# install docker 
#curl -sSL -O https://get.docker.com/builds/Linux/x86_64/docker-1.5.0 && chmod +x docker-1.5.0 && sudo mv docker-1.5.0 /usr/local/bin/docker
# Then start docker in daemon mode:
#sudo /usr/local/bin/docker -d

# install docker-compose
#curl -L https://github.com/docker/compose/releases/download/1.1.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
#chmod +x /usr/local/bin/docker-compose


