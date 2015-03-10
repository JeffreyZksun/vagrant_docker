Windows 7 OS
====

- Vagrant box: Ubuntu
- Host OS: Windows 7

Prerequisite
----
**Installation**

1. [Virtual box](http://www.virtualbox.org/ "Virtual box")
2. [Vagrant](https://docs.vagrantup.com/v2/installation/ "Vagrant")
3. [Git]( http://git-scm.com/download/win "git")


Start and ssh connect to vagrant box
----

	Open gitbash (not the window cmd. You can use git, ssh in this bash.)
	$ cd path\to\git_repo\
	$ git clone https://github.com/JeffreyZksun/vagrant_docker.git
	$ cd ubuntu_env
	$ vagrant up
	$ vagrant ssh
	$ cd /vagrant
	... do what you want, you can edit source file in host OS ...


Reference
----
 - [Getting Started with Vagrant on Windows](http://www.sitepoint.com/getting-started-vagrant-windows/)



----------


Mac OS X
====

- Vagrant box: Ubuntu
- Host OS: Mac OS X

Prerequisite
----
**Installation**

1. [Virtual box](http://www.virtualbox.org/ "Virtual box")
2. [Vagrant](https://docs.vagrantup.com/v2/installation/ "Vagrant")
3. [Git]( http://git-scm.com/download/mac "git")

Start and ssh connect to vagrant box
----

	Open bash
	$ cd path\to\git_repo\
	$ git clone https://github.com/JeffreyZksun/vagrant_docker.git
	$ cd ubuntu_env
	$ vagrant up
	$ vagrant ssh
	$ cd /vagrant
	... do what you want, you can edit source file in host OS ...


