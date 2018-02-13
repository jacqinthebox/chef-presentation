Set-ExecutionPolicy Bypass
New-Item -path "registry::hklm\software\policies\microsoft\Internet Explorer\Main" -Force
New-ItemProperty -path "registry::hklm\software\policies\microsoft\Internet Explorer\Main" -Name DisableFirstRunCustomize -PropertyType dword -Value 1
Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
Install-PackageProvider -Name Nuget -Force
Install-Module Posh-Git -Force
Install-Module ISESteroids -Scope CurrentUser -Force
choco install visualstudiocode -force -yes
choco install firefox -force -yes
choco install git -force -yes
choco install conemu -force -yes
choco install notepadplusplus -force -yes