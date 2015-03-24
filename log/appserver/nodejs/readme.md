Getting Started
====
This containter will execute the nodejs code of the current folder in the container. 

	$ docker build -t "jeffreyzksun/nodejs:v0.10.36" .
	$ docker run --name nodejsserver -v $(pwd):/service/www -d jeffreyzksun/nodejs:v0.10.36

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


Shared folder
----
| Host   | Docker container | 
| $(pwd) | /service/www 		|


Base image: https://registry.hub.docker.com/_/node/

 