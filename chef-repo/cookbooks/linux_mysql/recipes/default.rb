#
# Cookbook Name:: linux_mysql
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


cookbook_file "/tmp/seed-mysql.sql" do
  source 'createdb.sql'
  owner 'root'
  group 'root'
  mode '0777'
end


# Configure the MySQL client.
mysql_client 'foo' do
  action :create
end

# Configure the MySQL service.
mysql_service 'foo' do
  initial_root_password 'root'
  bind_address '0.0.0.0'
  action [:create, :start]
end

execute 'initialize jaab database' do
  command "mysql -e 'CREATE DATABASE jaab' -uroot -proot -h 127.0.0.1"
end

execute 'initialize jaab database' do
  command "mysql -h 127.0.0.1 -uroot -proot -D jaab < /tmp/seed-mysql.sql"
end

execute 'create user monty' do
  command "mysql -e \"CREATE USER 'monty'@'%' IDENTIFIED BY 'monty'\" -uroot -proot -h 127.0.0.1"
end

execute 'grant all privileges to monty' do
  command "mysql -e \"GRANT ALL PRIVILEGES ON *.* TO 'monty'@'%' WITH GRANT OPTION\" -uroot -proot -h 127.0.0.1"
end
