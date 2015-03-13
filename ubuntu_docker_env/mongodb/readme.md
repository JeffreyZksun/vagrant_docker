Getting Started
====

	$ docker build -t "jeffreyzksun/mongodb:v3.0.0" .
	$ docker run --name mongodbserver -p 27017:27017 -v $(pwd)/db:/data/db -d jeffreyzksun/mongodb:v3.0.0
	
Connect mongodb with port 27017. 

Next time use the start/stop instrunction to operation the container.

	$ docker stop mongodbserver
	$ docker start mongodbserver

Infrastructure
====
OS
----

- debian:wheezy

Softwares
----

- mongodb v3.0.0

Default command
----

	`/entrypoint.sh mongod` inclide the container. 

Port mapping
----

| Host   | Docker container | 
| 27017  | 27017 			|

Shared folder
----
| Host   	| Docker container 	| 
| $(pwd)/db | /data/db 			|


Base image: https://registry.hub.docker.com/_/mongo/ 

Other useful commands
====

	$ docker attach mongodbserver
	$ docker inspect mongodbserver
	$ docker logs mongodbserver
	$ docker run -p 27017:27017 -v $(pwd)/db:/data/db --rm -it jeffreyzksun/mongodb:v3.0.0  /bin/bash 
	$ docker history jeffreyzksun/mongodb:v3.0.0
 
entrypoint.sh inside the container.
===

	#!/bin/bash
	set -e

	if [ "${1:0:1}" = '-' ]; then
	        set -- mongod "$@"
	fi

	if [ "$1" = 'mongod' ]; then
	        chown -R mongodb /data/db

	        numa='numactl --interleave=all'
	        if $numa true &> /dev/null; then
	                set -- $numa "$@"
	        fi

	        exec gosu mongodb "$@"
	fi

	exec "$@"