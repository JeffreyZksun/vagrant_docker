Getting Started
====
This container runs logslash-forwarder service.

    $ docker build -t "jeffreyzksun/logslash-forwarder:v0.4.0" .
    $ docker run --name logforwarder --net=host -v /tmp/logs:/logs -v $(pwd)/certs:/opt/certs -v $(pwd)/conf:/opt/conf -d jeffreyzksun/logslash-forwarder:v0.4.0
    

Note: `--net=host` gives container the whole control to the network of the host. When use localhost or 127.0.0.1 inside the container, this addess is the host's lo address. 

Note: the certs should be the same as that used in the logslash server.

Send log to logslash server via forwarder
====

Make sure the logslash server is running.

    cat >> /tmp/logs/test.log
        test
        test
        test
        ^C
    # You should see the messages show up on logstash


Infrastructure
====
OS
----

- ubuntu:14.04

Softwares
----

- logslash-forwarder v0.4.0

Default command
----

    `/opt/logstash-forwarder/bin/logstash-forwarder -config /opt/conf/config.json` inclide the container. 

Port mapping
----


Shared folder
----
| Host                  | Docker container  | 
| $(pwd)/certs          | /opt/certs        |
| $(pwd)/conf           | /opt/conf         |
| /tmp/logs             | /logs             |

Base image: https://registry.hub.docker.com/_/ubuntu/