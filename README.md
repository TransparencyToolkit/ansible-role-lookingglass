ansible-role-lookingglass
=========================

This is a development/testing environment for [Transparency Toolkit](https://transparencytoolkit.org/)'s [LookingGlass](https://github.com/TransparencyToolkit/LookingGlass) software. It uses [Vagrant](https://www.vagrantup.com/downloads.html)/[VirtualBox](https://www.virtualbox.org/wiki/Linux_Downloads) plus [Ansible](https://www.ansible.com/), which can be installed via Python's [pip](https://bootstrap.pypa.io/get-pip.py). There is also a `Dockerfile` for running the role in a container via [Docker](https://www.docker.com/).

How to get started
------------------

Make sure Vagrant and Ansible are installed (`sudo pip install -U ansible`), and then run:

    vagrant up --provision

Port 8080 on the host machine should be forwarded to port 80 on the guest virtual machine.

Tested with Ansible 2.1.0 and Vagrant 1.8.4 on Debian GNU/Linux (jessie).

Using with Docker
-----------------

First, make sure you have Docker. Their [official install script](https://get.docker.com) can take care of that for you.

To build the image:

    docker build -t lookingglass .

To run a container and forward port 8080 on the host machine to port 80 inside the container:

    docker run --name lookingglass -p 8080:80 -d lookingglass

Tested with Docker 1.11.2.

Default role variables
----------------------

The [Snowden doc search](https://search.edwardsnowden.com/) is the default LG instance here, but other types of instances are available.

    lg_dataspec: 'https://github.com/TransparencyToolkit/dataspec-snowden'
    lg_data: 'https://github.com/transparencytoolkit/nsa-data'

Dependencies
------------

The official [RVM role](https://github.com/rvm/rvm1-ansible) for Ansible. Installed via `ansible-galaxy install -r requirements.yml`.

Author
------

Kevin Gallagher ([@ageis](https://twitter.com/ageis))
