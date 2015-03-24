Centralized log management
============

The is a project to demo manage the container log in the centrialized logslash server. This soluction can be used in your backend to manage the logs.

 - Logstash: The server component of Logstash that processes incoming logs. It is an open source tool for collecting, parsing, and storing logs for future use. 
 - Elasticsearch: Stores all of the logs
 - Kibana: Web interface for searching and visualizing logs
 - Logstash Forwarder: Installed on servers that will send their logs to Logstash, Logstash Forwarder serves as a log forwarding agent that utilizes the lumberjack networking protocol to communicate with Logstash

Log management
====

Basically there a re three approaches to collect the log. We are using #3 in this project.


 1. Collection inside container - Each container starts up a daemon log collection process. This manner break the rule: run a process in a container.
 2. Collection outside conatiner - A single collection agent runs on the host machine. Container writes the log to the mounted volume.
 3. Collection in separate container - A single collection agent runs in a separate log container. The logs volume mounts to both the app and log container.


Get started
====

	$ vagrant up
	$ vagrant ssh

	$ cd /vagrant
	$ ./build.sh
	$ ./start.sh

Visit http://localhost:5601 to access the Kibana interface

Send log to logslash server via TCP port
====

	$ netcat localhost 514
	    > test
	    > test
	    > CTRL+C
	# You should see the messages show up on logstash

Send log to logslash server via forwarder
====
	cat >> /tmp/logs/test.log
		test
		test
		test
		^C
	# You should see the messages show up on logstash

Note: forwarder monitors the file /tmp/logs/test.log in the container.

Exposed ports (elk)
====

	514  - Logstash: syslog
	5043 - Logstash: logstash forwarder
	9292 - Logstash: Logstash UI
	5601 - Kibana

Reference
====

 - [Elasticsearch + Logslah + Kibana](https://github.com/denibertovic/elk-stack-docker)
 - [Logslash forwarder](https://github.com/denibertovic/logstash-forwarder-dockerfile)
 - [How To Use Logstash and Kibana To Centralize Logs On Ubuntu 14.04](https://www.digitalocean.com/community/tutorials/how-to-use-logstash-and-kibana-to-centralize-and-visualize-logs-on-ubuntu-14-04)

