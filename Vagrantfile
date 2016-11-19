# -*- mode: ruby -*-
# vi: set ft=ruby :

$hostfile = <<HOSTFILE
Add-Content $ENV:windir\\System32\\drivers\\etc\\hosts "192.168.56.3 `t `t chefserver.dev.datbedrijf.nl"
Add-Content $ENV:windir\\System32\\drivers\\etc\\hosts "192.168.56.3 `t `t chefserver"
Add-Content $ENV:windir\\System32\\drivers\\etc\\hosts "192.168.56.20 `t `t mysql01"
Add-Content $ENV:windir\\System32\\drivers\\etc\\hosts "192.168.56.20 `t `t mysql01.dev.datbedrijf.nl"
netsh advfirewall set allprofiles state off
HOSTFILE

Vagrant.configure(2) do |config|

  config.vm.define "win10" do |win10_config|
    win10_config.vm.box = "windows_10"
    win10_config.vm.hostname = "win10"
    win10_config.vm.network "private_network", ip: "192.168.56.100"

    win10_config.vm.provider "virtualbox" do |v|
      v.linked_clone = true
      v.customize ["modifyvm", :id, "--vram", "128"]
      v.customize ["modifyvm", :id, "--accelerate3d", "on"]
    end

    win10_config.vm.provision :shell,inline: $hostfile
  end

  config.vm.define "app01" do |app01_config|
    app01_config.vm.box_check_update = true
    app01_config.vm.box = "jacqinthebox/windowsserver2016"
    app01_config.vm.hostname = "app01"
    app01_config.vm.network "private_network", ip: "192.168.56.10"

    app01_config.vm.provider "virtualbox" do |v| 
      v.linked_clone = true   
    end

    app01_config.vm.provision :shell,inline: $hostfile
  end

  config.vm.define "mysql01" do |mysql01_config|
    mysql01_config.vm.box_check_update = true
    mysql01_config.vm.box = "ubuntu/trusty64"
    mysql01_config.vm.hostname = "mysql"
    mysql01_config.vm.network "private_network", ip: "192.168.56.20"

    mysql01_config.vm.provider "virtualbox" do |prl|
      prl.linked_clone = true
    end

    mysql01_config.vm.provision "shell", inline: <<-SHELL
		sudo apt-get update && sudo apt-get upgrade -y
		apt-get install -y wget git curl 
		echo "192.168.56.10  app01.dev.datbedrijf.nl app01" >> /etc/hosts
		echo "192.168.56.3  chefserver.dev.datbedrijf.nl chefserver" >> /etc/hosts
    SHELL
  end

  config.vm.define "chefserver" do |chefserver_config|
    chefserver_config.vm.box_check_update = true
    chefserver_config.vm.box = "bento/ubuntu-14.04"
    chefserver_config.vm.hostname = "chefserver"
    chefserver_config.vm.network "private_network", ip: "192.168.56.3"

    chefserver_config.vm.provider "virtualbox" do |v|
      v.linked_clone = true
      v.memory = 4096
      v.cpus = 2
    end

    chefserver_config.vm.provider "virtualbox" do |prl|
      prl.linked_clone = true
    end

    chefserver_config.vm.provision "shell", inline: <<-SHELL
					sudo apt-get update && sudo apt-get upgrade -y
					apt-get install -y wget git curl 
					echo "127.0.0.1 chefserver.dev.datbedrijf.nl chefserver" >> /etc/hosts
					echo "192.168.56.10  app01.dev.datbedrijf.nl app01" >> /etc/hosts
					echo "192.168.56.20  mysql01.dev.datbedrijf.nl mysql" >> /etc/hosts
    SHELL
  end
end
