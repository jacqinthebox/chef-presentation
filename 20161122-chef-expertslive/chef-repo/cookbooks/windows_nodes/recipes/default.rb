#
# Cookbook Name:: windows_nodes
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

dsc_resource 'chef-log-files' do
  resource :File
  property :Ensure, 'Present'
  property :Type, 'Directory'
  property :DestinationPath, 'c:\runlogs'
end

windows_task 'chef-client' do
  user 'vagrant'
  password 'vagrant'
  cwd 'C:\\opscode\\chef\\bin'
  command 'chef-client -L C:\\runlogs\\'
  run_level :highest
  frequency :onstart 
  frequency :minute
  frequency_modifier 30
end