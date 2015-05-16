# Nodejs
#
# VERSION               0.0.1
#
FROM mongo:3.0.0
MAINTAINER Jeffrey Sun <jeffrey.sun@autodesk.com>

# -v /logs/mongodb:/logs/mongodb does't work. db can't start. there is file permission error.
#RUN mkdir -p /logs/mongodb && chown -R mongodb:mongodb /logs/mongodb
#VOLUME /logs/mongodb
#COPY config/mongodb.conf /etc/mongodb.conf
#CMD ["mongod", "--config", "/etc/mongodb.conf", "--rest"]

# start the rest interface.
CMD ["mongod", "--rest"]
