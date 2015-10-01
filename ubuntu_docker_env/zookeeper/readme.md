Get started
====

This page describes start the zookeeper server in the docker container and start the zookeeper cli to connect the server in another docker container.


Start the zookeeper servier with the published docker image.

	docker run --name=zookeeper -d -p 2181:2181 -p 2888:2888 -p 3888:3888 mesoscloud/zookeeper:3.4.6-centos


Start the cli to connect the zookeeper server.

	$ docker run --rm -it --link zookeeper:zookeeper mesoscloud/zookeeper:3.4.6-centos /bin/bash
	# /opt/zookeeper/bin/zkCli.sh -server ${ZOOKEEPER_PORT_2181_TCP_ADDR}:2181
	[zk: 172.17.0.2:2181(CONNECTED) 0] help
	...


Reference

1. https://zookeeper.apache.org/doc/r3.3.3/zookeeperStarted.html
