Getting Started
====
This container runs a redis service at port 6379. You can you a folder in the host os to store the database data.

	$ docker build -t "jeffreyzksun/redis:v2.8" .
	$ docker run --name redisserver -p 6379:6379 -v /data:/data -d jeffreyzksun/redis:v2.8
	
Connect mongodb with port 6379. 

	$ docker run -it --link redisserver:redis --rm jeffreyzksun/redis:v2.8 sh -c 'exec redis-cli -h "$REDIS_PORT_6379_TCP_ADDR" -p "$REDIS_PORT_6379_TCP_PORT"'

Next time use the start/stop instrunction to operate the container.

	$ docker stop redisserver
	$ docker start redisserver

Infrastructure
====
OS
----

- debian:wheezy

Softwares
----

- redis v2.8

Default command
----

	`/entrypoint.sh redis-server` inclide the container. 

Port mapping
----

| Host  | Docker container 	| 
| 6379  | 6379 				|

Shared folder
----
| Host   	| Docker container 	| 
| /data 	| /data 			|


Base image: https://registry.hub.docker.com/_/redis/ 

Other useful commands
====

	$ docker attach redisserver
	$ docker inspect redisserver
	$ docker logs redisserver
	$ docker run -p 6379:6379 -v /data:/data --rm -it jeffreyzksun/redis:v2.8  /bin/bash 
	$ docker history jeffreyzksun/redis:v2.8