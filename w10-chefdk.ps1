#Invoke-Webrequest https://raw.githubusercontent.com/jacqinthebox/powershell-training/master/tools/AdventureWorks.ps1 -UseBasicParsing | Invoke-WebRequest

Set-ExecutionPolicy Bypass

New-Item -path "registry::hklm\software\policies\microsoft\Internet Explorer\Main" -Force
New-ItemProperty -path "registry::hklm\software\policies\microsoft\Internet Explorer\Main" -Name DisableFirstRunCustomize -PropertyType dword -Value 1

Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | iex
choco install chefdk visualstudiocode googlechrome windowsazurepowershell -force -yes
