Getting Started
====
The parent folder (host) of the dockerfile will be mounted to /data/www in containter. The start.sh script is executed by default after the container starts up. You'd better to put all the nodejs files in this folder.

	$ docker build -t "jeffreyzksun/nodejs:v0.10.24" .
	$ docker run --name nodejsserver -p 8000:80 -v $(pwd):/var/www -d jeffreyzksun/nodejs:v0.10.24
	
Access http://localhost:8000/package.json in the browser.

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

Default command
----

	npm install && npm start

Port mapping
----

| Host   | Docker container | 
| 8000   | 80 				|

Shared folder
----
| Host   	| Docker container 	| 
| $(pwd)/db | /data/db 			|


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