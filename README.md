vagrant-docker-ssh-key
======================

Vagrant + docker setup.   
ssh key connection using the portfoward


Local => Vagrant => Docker

## Infomation 
* Vagrant IP -> 192.168.34.10
* PortFoward
    * Vagrant(12222) ==> Docker(22)

## Setup
1. Local 

        $ git clone git@github.com:hacoten/vagrant-docker-ssh-key.git
        $ vagrant up
        $ vagrant ssh

2. Vagrant

        $ cd /vagrant
        $ docker build -t docker-image ./
        $ docker run -d -p 12222:22 -t docker-image

1. Local

        $ ssh docker@192.168.34.10 -i keys/id_rsa.docker -p 12222

