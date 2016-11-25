#knife bootstrap windows winrm 192.168.56.10 --winrm-user vagrant --winrm-password 'vagrant' --node-name app01 --node-ssl-verify-mode none
#knife bootstrap 192.168.56.20 --sudo -x vagrant --ssh-password vagrant --node-name mysql01

#knife winrm "192.168.56.10" "chef-client -c c:/chef/client.rb" -m -x vagrant -P "vagrant"

#knife node run_list add app01 'recipe[windows_appservers]'

#knife node run_list add 192.168.56 "recipe[linux_mysql]"

#knife node run_list add app01 'recipe[windows_nodes]'

#104.46.50.141

#knife bootstrap windows winrm 104.46.50.141 --winrm-user jp-admin --winrm-password 'Jacqueline12' --node-name app02 --node-ssl-verify-mode none
#netsh advfirewall set allprofiles state off