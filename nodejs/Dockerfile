# create an image with nodejs installed

FROM ubuntu:14.04
MAINTAINER Jeffrey Sun "jeffrey.zksun@gmail.com"
RUN apt-get update
RUN apt-get install wget -y

ENV REFRENSHED_AT 2015-02-28

# download and install nodejs
ENV NODE_VER="v0.10.24"
ENV NODE_URL="http://nodejs.org/dist/${NODE_VER}/node-${NODE_VER}-linux-x64.tar.gz"
RUN wget -c ${NODE_URL} -O /tmp/node-${NODE_VER}-linux-x64.tar.gz
RUN tar zxvf /tmp/node-${NODE_VER}-linux-x64.tar.gz
RUN rm -f /tmp/node-${NODE_VER}-linux-x64.tar.gz
RUN cp -rf node-${NODE_VER}-linux-x64/* /usr
RUN rm -rf node-${NODE_VER}-linux-x64