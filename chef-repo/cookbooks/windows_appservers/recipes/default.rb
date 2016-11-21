#
# Cookbook Name:: windows_appservers
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'chocolatey'
chocolatey_package 'jdk8' do
    action :install
end

chocolatey_package 'nssm' do
    action :install
end

#fetch de jar Files
powershell_script 'fetch the jar' do
  code <<-EOH
  Invoke-WebRequest https://dl.dropboxusercontent.com/u/25670673/jaab-0.0.1-SNAPSHOT.jar -outfile c:\\scripts\\jaab-0.0.1-SNAPSHOT.jar 
  EOH
end


batch "run jar in directory" do
  code "C:\\ProgramData\\chocolatey\\bin\\nssm.exe install jaabsvc \"c:\\Program Files\\Java\\jdk1.8.0_112\\bin\\java\" -jar c:\\scripts\\jaab-0.0.1-SNAPSHOT.jar"
end

