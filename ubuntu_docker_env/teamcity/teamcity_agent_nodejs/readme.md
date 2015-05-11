Getting Started
====
This containter will start a teamcity agnent with nodejs build environment.

	$ docker build -t "jeffreyzksun/teamcity_agent_nodejs:v0.10.24" .
	$ docker run -t --name teamcity_agent_nodejs -e TEAMCITY_SERVER=http://localhost:8111  --net=host -p 9090:9090 jeffreyzksun/teamcity_agent_nodejs:v0.10.24

	
Next time use the start/stop instrunction to operate the container.

	$ docker stop teamcity_agent_nodejs
	$ docker start teamcity_agent_nodejs

Infrastructure
====
OS
----

- [CentOS]

Softwares
----

- nodejs v0.10.24


Port mapping
----

| Host   | Docker container | 
| 	   	 |  				|

Shared folder
----
| Host   | Docker container | 
|  		 | 					|


Other useful commands
====

	$ docker attach teamcity_agent_nodejs
	$ docker inspect teamcity_agent_nodejs
	$ docker logs teamcity_agent_nodejs
	$ docker run --rm -it --net=host -p 9090:9090 -e TEAMCITY_SERVER=http://localhost:8111 jeffreyzksun/teamcity_agent_nodejs:v0.10.24  /bin/bash 
	$ docker history jeffreyzksun/teamcity_agent_nodejs:v0.10.24

