Introduction
====
This is a tutorial to setup teamcity CI system to build the nodejs app. Run the server on a machine with memory greater than 2G. 


Steps
====

1. Setup teamcity server


	$ docker run -t -name teamcity_server -p 8111:8111 -v /logs/teamcity_server:/opt/TeamCity/logs -v /data/teamcity:/data/teamcity ariya/centos6-teamcity-server

2. Open http://localhost:8111 to access the teamcity admin page.

3. Register admin user and make some configuration for the first access.

4. BUild the agent image (refer to teamcity_agent_nodejs/readme.md). Then start the container.

	$ docker run -t --name teamcity_agent_nodejs -e TEAMCITY_SERVER=http://localhost:8111  --net=host -p 9090:9090 jeffreyzksun/teamcity_agent_nodejs:v0.10.24

5. Authorize the agent in the admin page.

6. Add project settings.

Notes
====
In the agent image, we need to install all the build tools.

Reference
====

http://ariya.ofilabs.com/2015/03/continuous-integration-for-node-js-projects-with-teamcity.html