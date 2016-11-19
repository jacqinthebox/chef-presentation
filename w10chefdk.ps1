#prepare the ChefDK workstation.
#run on a clean workstation
#Invoke-Webrequest https://raw.githubusercontent.com/jacqinthebox/chef-presentation/master/w10chefdk.ps1 -UseBasicParsing | Invoke-Expression

Set-ExecutionPolicy Bypass

New-Item -path "registry::hklm\software\policies\microsoft\Internet Explorer\Main" -Force
New-ItemProperty -path "registry::hklm\software\policies\microsoft\Internet Explorer\Main" -Name DisableFirstRunCustomize -PropertyType dword -Value 1

Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
Invoke-Webrequest https://raw.githubusercontent.com/mmillar-bolis/ps-motd/master/Get-MOTD.ps1 -outfile $env:USERPROFILE\Documents\WindowsPowerShell\Get-MOTD.ps1

Install-Module Posh-Git -Force
Install-Module AzureRM -Force
Install-Module Azure -Force

Invoke-Webrequest https://raw.githubusercontent.com/jacqinthebox/chef-presentation/master/Microsoft.PowerShell_profile.ps1 -OutFile C:\Users\vagrant\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
Invoke-Webrequest https://raw.githubusercontent.com/jacqinthebox/chef-presentation/master/Microsoft.PowerShellISE_profile.ps1 -OutFile C:\Users\vagrant\Documents\WindowsPowerShell\Microsoft.PowerShellISE_profile.ps1

choco install chefdk -force -yes
choco install visualstudiocode -force -yes
choco install googlechrome -force -yes
choco install git -force -yes
choco install conemu -force -yes


