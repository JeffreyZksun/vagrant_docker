# logslash-forwarder v 0.4.0
#
# VERSION               0.0.1
#
FROM ubuntu:14.04
MAINTAINER Jeffrey Sun <jeffrey.sun@autodesk.com>

RUN echo 'deb http://packages.elasticsearch.org/logstashforwarder/debian stable main' | tee /etc/apt/sources.list.d/logstashforwarder.list
RUN wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
RUN apt-get update && apt-get install logstash-forwarder

# The root folder of the server.
RUN mkdir -p /opt/certs && mkdir -p /opt/conf && mkdir -p /logs
VOLUME ["/opt/certs", "/opt/conf", "/logs"]

# start the server
CMD /opt/logstash-forwarder/bin/logstash-forwarder -config /opt/conf/config.json
