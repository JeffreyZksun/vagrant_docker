Centralized log system
============

The is a project to demo manage the container log in the centrialized logslash server.

Log-forwarder runs on the same host as app container. It forwards the log from app container to logslash server.


Get started
====

	$ vagrant up
	$ vagrant ssh

	$ cd /vagrant
	$ ./start.sh

Visit http://localhost:5601 to access the Kibana interface


Send log to logslash
====

	$ netcat localhost 514
	    > test
	    > test
	    > CTRL+C
	# You should see the messages show up on logstash


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

