download starter kit

cd 

```
knife ssl fetch
knife ssl check

```

bootstrap a node

```
knife bootstrap windows winrm 192.168.56.10 --winrm-user vagrant --winrm-password 'vagrant' --node-name app01 --node-ssl-verify-mode none
knife bootstrap mysql01.dev.datbedrijf.nl --sudo -x vagrant --ssh-password vagrant --node-name mysql01
```

create a cookbook

```
cd cookbooks
chef generate cookbook all_windows
cd all_windows
```
