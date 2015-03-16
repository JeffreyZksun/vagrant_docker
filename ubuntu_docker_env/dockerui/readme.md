Get started
====

DockerUI is a web interface to docker remote API.

	$ docker run --name=dockerui -d -p 9000:9000 --restart=always --privileged -v /var/run/docker.sock:/var/run/docker.sock dockerui/dockerui

	Open your browser to http://<dockerd host ip>:9000