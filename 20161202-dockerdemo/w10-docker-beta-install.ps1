# install docker beta
# restart

If ((Test-Path c:\dockerlab) -eq $False) { New-Item c:\dockerlab -ItemType Directory }
Invoke-WebRequest https://download.docker.com/win/beta/InstallDocker.msi -OutFile C:\dockerlab\InstallDocker.msi
Invoke-WebRequest https://download.docker.com/kitematic/Kitematic-Windows.zip -OutFile c:\dockerlab\Kitematic-Windows.zip
Expand-Archive -Path C:\dockerlab\Kitematic-Windows.zip -DestinationPath C:\dockerlab\kitematic

msiexec /i C:\dockerlab\InstallDocker.msi /qb

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
