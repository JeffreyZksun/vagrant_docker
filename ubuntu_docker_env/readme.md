Infrastructure
====
OS
----

- [Ubuntu 14.4 x64](https://vagrantcloud.com/ubuntu/boxes/trusty64)

Softwares
----

- Docker 1.5.0
- Docker-compose 1.1.0

Ports mapping
----

| Host   | Vagrant Box  | 
| 8000   | 8000 		|


Docker container rules
====
The folder structure for the service related stuffs.

 - `/service/xxx` The source code of the service.
 - `/data/xxx` The data storage.
 - `/config/xxx` The config files. 

Tips
====

 - Once the bootstrap.sh changes, destroy the vm and recreate it again.
 - Once the vagrantfile changes, like port mapping is changed, halt the vm and run reload.

Vagrant root user password
====
password: vagrant

