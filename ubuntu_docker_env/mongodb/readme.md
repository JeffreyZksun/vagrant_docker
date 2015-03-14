Getting Started
====
This container runs a mongodb service at port 27017. You can you a folder in the host os to store the database data.

	$ docker build -t "jeffreyzksun/mongodb:v3.0.0" .
	$ docker run --name mongodbserver -p 27017:27017 -v /data/db:/data/db -d jeffreyzksun/mongodb:v3.0.0
	
Connect mongodb with port 27017. 

	$ docker run -it --link mongodbserver:mongo --rm jeffreyzksun/mongodb:v3.0.0 sh -c 'exec mongo "$MONGO_PORT_27017_TCP_ADDR:$MONGO_PORT_27017_TCP_PORT/test"'
	$ docker run -it --net=host --rm jeffreyzksun/mongodb:v3.0.0 mongo

Next time use the start/stop instrunction to operate the container.

	$ docker stop mongodbserver
	$ docker start mongodbserver

Infrastructure
====
OS
----

- debian:wheezy

Softwares
----

- mongodb v3.0.0

Default command
----

	`/entrypoint.sh mongod` inclide the container. 

Port mapping
----

| Host   | Docker container | 
| 27017  | 27017 			|

Shared folder
----
| Host   	| Docker container 	| 
| /data/db | /data/db 			|

Note: if the host OS is a virtual box machine. Don't use the shared folder as the volume, since there is permission issue.

Base image: https://registry.hub.docker.com/_/mongo/ 

Other useful commands
====

	$ docker attach mongodbserver
	$ docker inspect mongodbserver
	$ docker logs mongodbserver
	$ docker run -p 27017:27017 -v /data/db:/data/db --rm -it jeffreyzksun/mongodb:v3.0.0  /bin/bash 
	$ docker history jeffreyzksun/mongodb:v3.0.0
 
entrypoint.sh inside the container.
===

	#!/bin/bash
	###Exit immediately if a command exits with a non-zero status.
	set -e

	#### the first parameter is ‘-'
	if [ "${1:0:1}" = '-' ]; then
	####"$@"  Stores all the arguments that were entered on the command line, individually quoted ("$1" "$2" …).
	#### Then Assign any remaining arguments after the nongod parameters.
	       set -- mongod "$@"
	fi

	if [ "$1" = 'mongod' ]; then
	    chown -R mongodb /data/db

	    numa='numactl --interleave=all'
		### Set a memory interleave policy. Memory will be allocated using round robin on true policy. Basically means this server is a numa architecture.
	    if $numa true &> /dev/null; then
			#### Assign any remaining arguments after the 'numactl --interleave=all' parameters.
	        set -- $numa "$@"
	    fi

		## same as su, means under mongodb user, exec command with the all parameters.
	    exec gosu mongodb "$@"
	fi

	exec "$@"


Trouble shouting
====

The mongodb service fails to start when use the mounted volume in the virtual box image. The reason is because the  folder is mounted in using vbox shared folders. See https://github.com/docker/docker/issues/9619.

	$ docker run --rm -p 27017:27017 -v $(pwd)/db7:/data/db mongo
	2015-03-13T07:37:55.820+0000 I CONTROL  [initandlisten] MongoDB starting : pid=1 port=27017 dbpath=/data/db 64-bit host=
	c14ce6f563e6
	2015-03-13T07:37:55.821+0000 I CONTROL  [initandlisten] db version v3.0.0
	2015-03-13T07:37:55.821+0000 I CONTROL  [initandlisten] git version: a841fd6394365954886924a35076691b4d149168
	2015-03-13T07:37:55.822+0000 I CONTROL  [initandlisten] OpenSSL version: OpenSSL 1.0.1e 11 Feb 2013
	2015-03-13T07:37:55.822+0000 I CONTROL  [initandlisten] build info: Linux ip-10-171-101-151 3.2.0-4-amd64 #1 SMP Debian
	3.2.46-1 x86_64 BOOST_LIB_VERSION=1_49
	2015-03-13T07:37:55.822+0000 I CONTROL  [initandlisten] allocator: tcmalloc
	2015-03-13T07:37:55.823+0000 I CONTROL  [initandlisten] options: {}
	2015-03-13T07:37:55.847+0000 I JOURNAL  [initandlisten] journal dir=/data/db/journal
	2015-03-13T07:37:55.850+0000 I JOURNAL  [initandlisten] recover : no journal files present, no recovery needed
	2015-03-13T07:37:55.853+0000 I JOURNAL  [initandlisten] info preallocateIsFaster couldn't run due to: couldn't open file
	 /data/db/journal/tempLatencyTest for writing errno:9 Bad file descriptor; returning false
	2015-03-13T07:37:55.854+0000 I JOURNAL  [initandlisten] Unable to remove temporary file due to: boost::filesystem::remov
	e: Text file busy: "/data/db/journal/tempLatencyTest"
	2015-03-13T07:37:55.856+0000 I STORAGE  [initandlisten] exception in initAndListen: 13516 couldn't open file /data/db/jo
	urnal/j._0 for writing errno:9 Bad file descriptor, terminating
	2015-03-13T07:37:55.856+0000 I CONTROL  [initandlisten] now exiting
	2015-03-13T07:37:55.856+0000 I NETWORK  [initandlisten] shutdown: going to close listening sockets...
	2015-03-13T07:37:55.857+0000 I NETWORK  [initandlisten] removing socket file: /tmp/mongodb-27017.sock
	2015-03-13T07:37:55.858+0000 I NETWORK  [initandlisten] shutdown: going to flush diaglog...
	2015-03-13T07:37:55.858+0000 I NETWORK  [initandlisten] shutdown: going to close sockets...
	2015-03-13T07:37:55.858+0000 I STORAGE  [initandlisten] shutdown: waiting for fs preallocator...
	2015-03-13T07:37:55.858+0000 I STORAGE  [initandlisten] shutdown: final commit...
	2015-03-13T07:37:55.859+0000 I STORAGE  [initandlisten] shutdown: closing all files...
	2015-03-13T07:37:55.859+0000 I STORAGE  [initandlisten] closeAllFiles() finished
	2015-03-13T07:37:55.859+0000 I CONTROL  [initandlisten] dbexit:  rc: 100