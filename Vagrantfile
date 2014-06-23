# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    # https://vagrantcloud.com/99designs/ubuntu-docker
    config.vm.box = "99designs/ubuntu-docker"
    config.vm.hostname = "ubuntu-docker"
    config.vm.network "private_network", ip: "192.168.34.10"

    # run setup.sh
    config.vm.provision "shell", path: "setup.sh"

end
