# -*- mode: ruby -*-
# vi: set ft=ruby

$bootstrap = <<EOH
iwr https://raw.githubusercontent.com/jacqinthebox/presentations/master/win10devbox.ps1 -UseBasicParsing | iex
EOH

Vagrant.configure("2") do |config|
  config.vm.box = "jacqinthebox/windows10LTSB"
  config.vm.provision :shell,inline: $bootstrap
end
