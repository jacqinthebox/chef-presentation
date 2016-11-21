# Chef presentation demo env
### Download the Vagrant file and install the virtual servers with Vagrant


```
vagrant up --provider virtualbox
vagrant up --provider parallels
```


### Install the ChefDK on a clean Windows 10 workstation

```Powershell
iwr https://raw.githubusercontent.com/jacqinthebox/chef-presentation/master/w10chefdk.ps1 -UseBasicParsing | iex
```

### Install the Chef server on Ubuntu 14.04


* Adjust chefserver.txt and chefserver-config.txt to your needs.


```Bash
bash <(curl -s https://raw.githubusercontent.com/jacqinthebox/chef-presentation/master/chefserver.txt)
```

