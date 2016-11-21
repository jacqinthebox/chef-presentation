#
# Cookbook Name:: windows_appservers
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'chocolatey'
chocolatey_package 'jdk8' do
    action :install
end

dsc_resource 'chef-scripts-folder' do
  resource :File
  property :Ensure, 'Present'
  property :Type, 'Directory'
  property :DestinationPath, 'c:\scripts'
end

powershell_script 'fetch the non sucking service manager' do
  code <<-EOH
  Invoke-WebRequest https://dl.dropboxusercontent.com/u/25670673/nssm.exe  -outfile c:\\scripts\\nssm.exe 
  EOH
  not_if "Test-Path c:\\scripts\\nssm.exe"
  guard_interpreter :powershell_script
end


powershell_script 'fetch the jar' do
  code <<-EOH
  Invoke-WebRequest https://dl.dropboxusercontent.com/u/25670673/jaab-0.0.1-SNAPSHOT.jar -outfile c:\\scripts\\jaab-0.0.1-SNAPSHOT.jar 
  EOH
  not_if "Test-Path c:\\scripts\\jaab-0.0.1-SNAPSHOT.jar"
  guard_interpreter :powershell_script
end


batch "run jar in directory" do
  code "C:\\scripts\\nssm.exe install jaabsvc \"c:\\Program Files\\Java\\jdk1.8.0_112\\bin\\java\" -jar c:\\scripts\\jaab-0.0.1-SNAPSHOT.jar"
end


dsc_resource 'start the jaab service' do
  resource :Service
  property :Name, 'jaabsvc'
  property :State, 'Running'
end

