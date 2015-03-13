Getting Started
====
This containter will execute the nodejs code of the current folder in the container. The port 80 is exported. That means the nodejs code should listen on this port.

	$ docker build -t "jeffreyzksun/nodejs:v0.10.24" .
	$ docker run --name nodejsserver -p 8000:80 -v $(pwd):/service/www -d jeffreyzksun/nodejs:v0.10.24

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

- nodejs v0.10.24


Port mapping
----

| Host   | Docker container | 
| 8000   | 80 				|

Shared folder
----
| Host   | Docker container | 
| $(pwd) | /service/www 		|


Other useful commands
====

	$ docker attach nodejsserver
	$ docker inspect nodejsserver
	$ docker logs nodejsserver
	$ docker run -p 8000:80 -v $(pwd):/service/www --rm -it jeffreyzksun/nodejs:v0.10.24  /bin/bash 
	$ docker history jeffreyzksun/nodejs:v0.10.24
 
Trouble shouting
====
Failed to execute the build instruction. `$ docker build -t "jeffreyzksun/nodejs:v0.10.24" .`

The error looks like this: Error response from daemon: Cannot start container 9f3bd8d72f0704980cedacc068261c38e280e7314916245550a6d48431ea8f11: fork/exec /var/lib/docker/init/dockerinit-1.0.1: cannot allocate memory

Solution: execute `$ sudo service docker.io restart` and then try again.