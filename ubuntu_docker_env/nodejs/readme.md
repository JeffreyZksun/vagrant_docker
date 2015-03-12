
Create image from dockerfile
----

	$ docker build -t "jeffreyzksun/nodejs:v0.10.24" .

Start the container in daemon
----
	$ docker run --name nodejsserver jeffreyzksun/nodejs:v0.10.24  

Start container with interactive bash shell
----

	$ docker run -p 8000:80 -v $(pwd):/var/www --rm -it jeffreyzksun/nodejs:v0.10.24  /bin/bash 

Inspector image history
====
	$ sudo docker history jeffreyzksun/nodejs:v0.10.24
	IMAGE               CREATED             CREATED BY                                      SIZE
	12f8a054b33e        37 hours ago        /bin/sh -c #(nop) CMD [npm start]               0 B
	048e880ac80d        37 hours ago        /bin/sh -c #(nop) ONBUILD COPY . /usr/src/app   0 B
	f3e7ca9a0e22        37 hours ago        /bin/sh -c #(nop) ONBUILD RUN npm install       0 B
	2ba6140781cc        37 hours ago        /bin/sh -c #(nop) ONBUILD COPY package.json /   0 B
	941038c83cc9        37 hours ago        /bin/sh -c #(nop) WORKDIR /usr/src/app          0 B
	b3308f2210c0        37 hours ago        /bin/sh -c mkdir -p /usr/src/app                0 B
	435adac0c62b        37 hours ago        /bin/sh -c #(nop) CMD [node]                    0 B
	384194e9abd7        37 hours ago        /bin/sh -c curl -SLO "http://nodejs.org/dist/   22.1 MB
	e32ffc3be8f6        37 hours ago        /bin/sh -c #(nop) ENV NPM_VERSION=2.7.0         0 B
	995a055dadb3        2 days ago          /bin/sh -c #(nop) ENV NODE_VERSION=0.10.36      0 B
	998340f14a46        2 days ago          /bin/sh -c gpg --keyserver pool.sks-keyserver   21.38 kB
	97218cc5aae0        2 days ago          /bin/sh -c apt-get update && apt-get install    385.8 MB
	6a7520a7fd8c        2 days ago          /bin/sh -c apt-get update && apt-get install    122.5 MB
	1073b544a1cb        2 days ago          /bin/sh -c apt-get update && apt-get install    44.34 MB
	50ec2d202fe8        3 days ago          /bin/sh -c #(nop) CMD [/bin/bash]               0 B
	3b3a4796eef1        3 days ago          /bin/sh -c #(nop) ADD file:fb7c52fc8e65391715   122.8 MB
	511136ea3c5a        21 months ago                                                       0 B

Tips
====
Use `docker history 12f8a054b33e` to list the creation steps of the base nodejs image.

Trouble shouting
====
nstall the image. This step is optional, as Docker automatically installs images when you first run them. However, since it takes a few minutes we suggest you do this in advance.

$ docker run --rm vaharoni/trusted_sandbox:ruby-2.1.2.v2
If you see the message "you must provide a uid", then you are set.

Consider restarting the docker service if you receive an error that looks like this: Error response from daemon: Cannot start container 9f3bd8d72f0704980cedacc068261c38e280e7314916245550a6d48431ea8f11: fork/exec /var/lib/docker/init/dockerinit-1.0.1: cannot allocate memory

$ sudo service docker.io restart
and then try again.