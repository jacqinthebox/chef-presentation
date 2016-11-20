#
# Cookbook Name:: linux_mysql
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# copy the file
cookbook_file "/tmp/seed-mysql.sql" do
  source 'create-tables.sql'
  owner 'root'
  group 'root'
  mode '0777'
end


# Configure the MySQL client.
mysql_client 'default' do
  action :create
end

# Configure the MySQL service.
mysql_service 'default' do
  initial_root_password 'root'
  bind_address '0.0.0.0'
  action [:create, :start]
end

execute 'initialize blaat database' do
  command "mysql -e 'CREATE DATABASE jaab' -u root -h 127.0.0.1"
end

execute 'initialize jaab database' do
  command "mysql -h 127.0.0.1 -uroot -D jaab < /tmp/seed-mysql.sql"
end
