# Nodejs
#
# VERSION               0.0.1
#
FROM nodejs:0.10.36
MAINTAINER Jeffrey Sun <jeffrey.sun@autodesk.com>

# the port of the node service
EXPOSE 80

# The root folder of the server.
RUN mkdir -p /service/www
VOLUME /service/www

# start the server
WORKDIR /service/www
CMD npm install && npm start