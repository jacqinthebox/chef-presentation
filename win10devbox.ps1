# Script to bootstrap a Vagrant Win10 development box

Set-ExecutionPolicy Bypass

New-Item -path "registry::hklm\software\policies\microsoft\Internet Explorer\Main" -Force
New-ItemProperty -path "registry::hklm\software\policies\microsoft\Internet Explorer\Main" -Name DisableFirstRunCustomize -PropertyType dword -Value 1
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -Value 0

Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
Install-PackageProvider -Name Nuget -Force

Install-Module Posh-Git -Force
Install-Module ISESteroids -Scope CurrentUser -Force

Invoke-Webrequest https://raw.githubusercontent.com/jacqinthebox/presentations/master/Microsoft.PowerShell_profile.ps1 -OutFile $env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
Invoke-Webrequest https://raw.githubusercontent.com/jacqinthebox/presentations/master/Microsoft.PowerShellISE_profile.ps1 -OutFile $env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShellISE_profile.ps1

choco install visualstudiocode -force -yes
choco install googlechrome -force -yes
choco install git -force -yes
choco install conemu -force -yes
choco install notepadplusplus -force -yes
