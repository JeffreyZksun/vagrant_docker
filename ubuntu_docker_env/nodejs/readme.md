Getting Started
====
This containter will execute the nodejs code of the current folder in the container. The port 80 is exported. That means the nodejs code should listen on this port.

	$ docker build -t "jeffreyzksun/nodejs:v0.10.36" .
	$ docker run --name nodejsserver -p 8000:80 -v $(pwd):/service/www -d jeffreyzksun/nodejs:v0.10.36

Next time use the start/stop instrunction to operate the container.

	$ docker stop nodejsserver
	$ docker start nodejsserver

Infrastructure
====
OS
----

- [Ubuntu 14.4 x64]

Softwares
----

- nodejs v0.10.36


Port mapping
----

| Host   | Docker container | 
| 8000   | 80 				|

Shared folder
----
| Host   | Docker container | 
| $(pwd) | /service/www 		|


Base image: https://registry.hub.docker.com/_/node/


Other useful commands
====

	$ docker attach nodejsserver
	$ docker inspect nodejsserver
	$ docker logs nodejsserver
	$ docker run -p 8000:80 -v $(pwd):/service/www --rm -it jeffreyzksun/nodejs:v0.10.36  /bin/bash 
	$ docker history jeffreyzksun/nodejs:v0.10.36
 