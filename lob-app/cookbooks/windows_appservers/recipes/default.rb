#
# Cookbook Name:: windows_appservers
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'chocolatey'

chocolatey_package 'jdk8' do
    action :install
end

chocolatey_package '7zip' do
    action :install
end