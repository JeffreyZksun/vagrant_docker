Getting Started
====
This container runs a elasticsearch service at port 9200. You can you a folder in the host os to store the data.

	$ docker build -t "jeffreyzksun/elasticsearch:v1.4.4" .
	$ docker run --name esserver -p 9200:9200 -p 9300:9300 -v /data:/usr/share/elasticsearch/data -d jeffreyzksun/elasticsearch:v1.4.4
	
Connect es with port 9200. 

	$ curl ...

Next time use the start/stop instrunction to operate the container.

	$ docker stop esserver
	$ docker start esserver

You can use the command below to override the config file

	$ docker run -d -v "$pwd/config":/usr/share/elasticsearch/config jeffreyzksun/elasticsearch:v1.4.4

Infrastructure
====
OS
----

- debian:wheezy

Softwares
----

- elasticsearch v1.4.4

Default command
----

	`elasticsearch` inclide the container. 

Port mapping
----

| Host  | Docker container 	| 
| 9200  | 9200 				|
| 9300  | 9300 				|

Shared folder
----
| Host   	| Docker container 				| 
| /data 	| /usr/share/elasticsearch/data |


Base image: https://registry.hub.docker.com/_/elasticsearch/

Other useful commands
====

	$ docker attach esserver
	$ docker inspect esserver
	$ docker logs esserver
	$ docker run -p 9200:9200 -p 9300:9300 -v /data:/usr/share/elasticsearch/data --rm -it jeffreyzksun/elasticsearch:v1.4.4  /bin/bash 
	$ docker history jeffreyzksun/elasticsearch:v1.4.4