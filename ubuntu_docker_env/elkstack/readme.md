

Install docker and docker compose
====

	# curl -sSL https://get.docker.com/ | sh

Elastic search
====

 1. Dir layout: https://www.elastic.co/guide/en/elasticsearch/reference/current/setup-dir-layout.html


Logstash
====

 1. List all the installed plugins. `bin/plugin list`
 2. Install plugin with the step here https://www.elastic.co/guide/en/logstash/current/working-with-plugins.html

Trouble shooting
====
 
 1. Use `docker-compose run logstash /bin/sh` to login the container if the container can't be started successfully.

 1. Logstash report the errors below at startup phase. 
	
	logstash_1      | The error reported is: 
	logstash_1      |   undefined method `close' for nil:NilClass
	elkstack_logstash_1 exited with code 0

Use `docker-compose run logstash /bin/sh` to login the container. Add `--debug` parameter to show more information.

	logstash -f /etc/logstash/conf.d --debug

Start the container one by one can by pass the issue.

	docker-compose start elasticsearch
	docker-compose start logstash
	docker-compose start kibana