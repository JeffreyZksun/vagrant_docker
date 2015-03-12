# Nodejs
#
# VERSION               0.0.1
#
FROM ubuntu:14.04
MAINTAINER Jeffrey Sun <jeffrey.sun@autodesk.com>

RUN apt-get update && apt-get install -y \
  wget 

# install nodejs npm
ENV NODE_VER v0.10.24
ENV NODE_URL http://nodejs.org/dist/${NODE_VER}/node-${NODE_VER}-linux-x64.tar.gz
RUN wget -c ${NODE_URL} -O /tmp/node-${NODE_VER}-linux-x64.tar.gz
RUN tar zxvf /tmp/node-${NODE_VER}-linux-x64.tar.gz
RUN rm -f /tmp/node-${NODE_VER}-linux-x64.tar.gz
RUN cp -rf node-${NODE_VER}-linux-x64/* /usr
RUN rm -rf node-${NODE_VER}-linux-x64

# the port of the node service
EXPOSE 80

# The root folder of the server.
ENV SRC_ROOT /var/www
Volume $SRC_ROOT

# start the server
WORKDIR /var/www
CMD ["./start.sh"]