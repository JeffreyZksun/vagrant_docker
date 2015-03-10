Windows 7 OS
====

- Vagrant box: Windows
- Host OS: Windows 7

Prerequisite
----
**Installation**

1. [Virtual box](http://www.virtualbox.org/ "Virtual box")
2. [Vagrant](https://docs.vagrantup.com/v2/installation/ "Vagrant")
3. [Git]( http://git-scm.com/download/win "git")


Start and connect to vagrant box
----

	Open gitbash (not the window cmd. You can use git, ssh in this bash.)
	$ cd path\to\git_repo\
	$ git clone https://github.com/JeffreyZksun/vagrant_docker.git
	$ cd win7_env
	$ vagrant up
	Use the windows remote desktop connection to connect the os. (user name: vagrant, password: vagrant. Enable remote display "Display|RemoteDisplay" if fails.)
	... do what you want, you can edit source file in host OS ...

**Note**: `$ vagrant rdp` should work as well to connect guest windows machine. But I never succeed with it.

----------


Mac OS X
====

- Vagrant box: Windows
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
	Use the windows remote desktop connection to connect the os. (user name: vagrant, password: vagrant)
	... do what you want, you can edit source file in host OS ...