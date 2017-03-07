#!/bin/bash
#Install a new Ubuntu

##Init
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y  wget curl git gitk vim-nox build-essential linux-headers-$(uname -r)

 #Install Node.js from the binaries
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get install -y nodejs

#NPM FIX
echo "fixing npm"
mkdir ~/npm-global -p
echo "setting permissions on new npm-global folder for $USER"
sudo chown -R $USER:$USER ~/npm-global
npm config set prefix '~/npm-global'
#Open or create a ~/.profile file and add this line:
echo "export PATH=~/npm-global/bin:$PATH" >> ~/.profile
source ~/.profile