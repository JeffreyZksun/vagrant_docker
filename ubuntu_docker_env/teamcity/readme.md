Introduction
====
This is a tutorial to setup teamcity CI systeam to build the nodejs app.



Setup teamcity server
----

	$ docker run -t -name teamcity_server -p 8111:8111 -v /logs/teamcity_server:/opt/TeamCity/logs -v /data/teamcity:/data/teamcity ariya/centos6-teamcity-server

Open http://localhost:8111 to access the teamcity admin page.

Setup teamcity agent
----
Build the agent image first (refer to teamcity_agent_nodejs/readme.md). Then start the container.

	$ docker run -t --name teamcity_agent_nodejs -e TEAMCITY_SERVER=http://localhost:8111  --net=host -p 9090:9090 jeffreyzksun/teamcity_agent_nodejs:v0.10.24


Authorize the agent in the admin page.

Reference
====

http://ariya.ofilabs.com/2015/03/continuous-integration-for-node-js-projects-with-teamcity.html