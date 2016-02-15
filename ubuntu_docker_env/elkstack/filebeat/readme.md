

	$ curl -XPUT 'http://localhost:9200/_template/filebeat?pretty' -d@filebeat.template.json
 	$ ./filebeat -e -c filebeat.yml -d "publish"


Trouble shooting
====

	nc -vz localhost 5044