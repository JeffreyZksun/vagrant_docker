Getting Started
====
This container runs a haproxy service with ports 80 and 8101 exposes. The 8101 port is for the status monitor.

	$ docker build -t "jeffreyzksun/haproxy:v1.4.26" .
	$ docker run --name haproxyserver -p 8000:80 -p 8101:8101 -v "$pwd/haproxy.cfg":/usr/local/etc/haproxy/haproxy.cfg:ro -d jeffreyzksun/haproxy:v1.4.26
	
Connect haproxy with port 8000. 

	$ curl http://localhost:8000
	$ curl http://localhost:8101/stats

Next time use the start/stop instrunction to operate the container.

	$ docker stop haproxyserver
	$ docker start haproxyserver

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
| 8000  | 80 				|
| 8101  | 8101 				|

Shared folder
----



Base image: https://registry.hub.docker.com/_/haproxy/

Other useful commands
====

	$ docker attach haproxyserver
	$ docker inspect haproxyserver
	$ docker logs haproxyserver
	$ docker run -p 8000:80 -v "$pwd/haproxy.cfg":/usr/local/etc/haproxy/haproxy.cfg:ro --rm -it jeffreyzksun/haproxy:v1.4.26  /bin/bash 
	$ docker history jeffreyzksun/haproxy:v1.4.26