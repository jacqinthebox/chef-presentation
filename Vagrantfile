# -*- mode: ruby -*-
# vi: set ft=ruby

$bootstrap = <<EOH
iwr https://raw.githubusercontent.com/jacqinthebox/presentations/master/win10devbox.ps1 -UseBasicParsing | iex
EOH

Vagrant.configure("2") do |config|
  config.vm.box = "jacqinthebox/windows10LTSB"
  config.vm.hostname = "win10"
  #config.vm.network "private_network", ip: "192.168.56.100"

  config.vm.provider "virtualbox" do |v|
      v.linked_clone = true
      v.customize ["modifyvm", :id, "--vram", "128"]
      v.customize ["modifyvm", :id, "--accelerate3d", "on"]
   end
    
    config.vm.provider "parallels" do |p|
      p.linked_clone = true
    end
  config.vm.provision :shell,inline: $bootstrap
end
