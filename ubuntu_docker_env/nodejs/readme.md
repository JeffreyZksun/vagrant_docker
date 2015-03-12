Getting Started
====

	$ docker build -t "jeffreyzksun/nodejs:v0.10.24" .
	$ docker run --name nodejsserver -p 8000:80 -v $(pwd):/var/www -d jeffreyzksun/nodejs:v0.10.24
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
| $(pwd) | /var/www 		|


Other useful commands
====

	$ docker attach nodejsserver
	$ docker inspect nodejsserver
	$ docker run -p 8000:80 -v $(pwd):/var/www --rm -it jeffreyzksun/nodejs:v0.10.24  /bin/bash 
	$ docker history jeffreyzksun/nodejs:v0.10.24
 
Trouble shouting
====
Failed to execute the build instruction. `$ docker build -t "jeffreyzksun/nodejs:v0.10.24" .`

The error looks like this: Error response from daemon: Cannot start container 9f3bd8d72f0704980cedacc068261c38e280e7314916245550a6d48431ea8f11: fork/exec /var/lib/docker/init/dockerinit-1.0.1: cannot allocate memory

Solution: execute `$ sudo service docker.io restart` and then try again.