# Nodejs
#
# VERSION               0.0.1
#
FROM ariya/centos7-teamcity-agent
MAINTAINER Jeffrey Sun <jeffrey.sun@autodesk.com>

RUN yum -y install wget tar

# install nodejs npm
ENV NODE_VER v0.10.24
ENV NODE_URL http://nodejs.org/dist/${NODE_VER}/node-${NODE_VER}-linux-x64.tar.gz
RUN wget -c ${NODE_URL} -O /tmp/node-${NODE_VER}-linux-x64.tar.gz
RUN tar zxvf /tmp/node-${NODE_VER}-linux-x64.tar.gz
RUN rm -f /tmp/node-${NODE_VER}-linux-x64.tar.gz
RUN cp -rf node-${NODE_VER}-linux-x64/* /usr
RUN rm -rf node-${NODE_VER}-linux-x64

# copy from baseimage dockefile https://registry.hub.docker.com/u/ariya/centos7-teamcity-agent-nodejs/dockerfile/
EXPOSE 9090
CMD sudo -u teamcity -s -- sh -c "TEAMCITY_SERVER=$TEAMCITY_SERVER bash /setup-agent.sh run"