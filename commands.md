download starter kit

```
chef generate repo lob-app
cd lob-app
```
copy .chef folder from the starter kit to the root of this repo

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
chef generate cookbook all-windows
cd all-windows
```
