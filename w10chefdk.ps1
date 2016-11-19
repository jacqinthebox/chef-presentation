#Invoke-Webrequest https://raw.githubusercontent.com/jacqinthebox/chef-presentation/master/w10-chefdk.ps1 -UseBasicParsing | Invoke-Expression

Set-ExecutionPolicy Bypass

New-Item -path "registry::hklm\software\policies\microsoft\Internet Explorer\Main" -Force
New-ItemProperty -path "registry::hklm\software\policies\microsoft\Internet Explorer\Main" -Name DisableFirstRunCustomize -PropertyType dword -Value 1

Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
Invoke-Webrequest https://raw.githubusercontent.com/mmillar-bolis/ps-motd/master/Get-MOTD.ps1 -outfile $env:USERPROFILE\Documents\WindowsPowerShell\Get-MOTD.ps1
Install-Module Posh-Git -Force

choco install chefdk visualstudiocode googlechrome windowsazurepowershell conemu git -force -yes


