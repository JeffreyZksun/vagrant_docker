Getting Started
====
This container runs a haproxy service with ports 8101, 8102 and 8103 exposed. The 8101 port is for the status monitor. 8102 is for the external web servers. 8103 is for the web servers on the same host.

	$ docker build -t "jeffreyzksun/haproxy:v1.4.26" .
	$ docker run --name haproxyserver -p 8101:8101 -p 8102:8102 -p 8103:8103 --net=host -v "$pwd/haproxy.cfg":/usr/local/etc/haproxy/haproxy.cfg:ro -d jeffreyzksun/haproxy:v1.4.26
	
Connect haproxy with the ports. 

	$ curl http://localhost:8101/stats
	$ curl http://localhost:8102

Next time use the start/stop instrunction to operate the container.

	$ docker stop haproxyserver
	$ docker start haproxyserver

Note: `--net=host` gives container the whole control to the network of the host. When use localhost or 127.0.0.1 inside the container, this addess is the host's lo address. 

Infrastructure
====
OS
----

- debian:wheezy

Softwares
----

- haproxy v1.4.26

Default command
----

	`haproxy -f /usr/local/etc/haproxy/haproxy.cfg` inclide the container. 

Port mapping
----

| Host  | Docker container 	| 
| 8101  | 8101 				|
| 8102  | 8102 				|
| 8103  | 8103 				|

Shared folder
----



Base image: https://registry.hub.docker.com/_/haproxy/

Other useful commands
====

	$ docker attach haproxyserver
	$ docker inspect haproxyserver
	$ docker logs haproxyserver
	$ docker run -v "$pwd/haproxy.cfg":/usr/local/etc/haproxy/haproxy.cfg:ro --net=host --rm -it jeffreyzksun/haproxy:v1.4.26  /bin/bash 
	$ docker history jeffreyzksun/haproxy:v1.4.26