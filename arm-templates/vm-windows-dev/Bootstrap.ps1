param
(
 [Parameter(Mandatory = $true)]
 [string] $HostName,
 [Parameter(Mandatory = $False)]
 [bool] $DevMachine = $False
 
)


Function Delete-WinRMListener
{
  try
  {
    $config = Winrm enumerate winrm/config/listener
      foreach($conf in $config)
      {
        if($conf.Contains("HTTPS"))
        {
          Write-Verbose "HTTPS is already configured. Deleting the exisiting configuration."

            winrm delete winrm/config/Listener?Address=*+Transport=HTTPS
            break
        }
      }
  }
  catch
  {
    Write-Verbose -Verbose "Exception while deleting the listener: $_.Exception.Message"
  }
}

Function Configure-WinRMHttpsListener
{
  param([string] $HostName,
      [string] $port)

# Delete the WinRM Https listener if it is already configured
    Delete-WinRMListener

# Create a test certificate
      $thumbprint = (Get-ChildItem cert:\LocalMachine\My | Where-Object { $_.Subject -eq "CN=" + $hostname } | Select-Object -Last 1).Thumbprint
      if(-not $thumbprint)
      {
# makecert ocassionally produces negative serial numbers
# which golang tls/crypto <1.6.1 cannot handle
# https://github.com/golang/go/issues/8265
        $serial = Get-Random
          .\makecert -r -pe -n CN=$hostname -b 01/01/2012 -e 01/01/2022 -eku 1.3.6.1.5.5.7.3.1 -ss my -sr localmachine -sky exchange -sp "Microsoft RSA SChannel Cryptographic Provider" -sy 12 -# $serial
          $thumbprint=(Get-ChildItem cert:\Localmachine\my | Where-Object { $_.Subject -eq "CN=" + $hostname } | Select-Object -Last 1).Thumbprint

          if(-not $thumbprint)
          {
            throw "Failed to create the test certificate."
          }
      }    

  $response = cmd.exe /c .\winrmconf.cmd $hostname $thumbprint
}

Function Add-FirewallException
{
  param([string] $port)

# Delete an exisitng rule
    netsh advfirewall firewall delete rule name="Windows Remote Management (HTTPS-In)" dir=in protocol=TCP localport=$port

# Add a new firewall rule
    netsh advfirewall firewall add rule name="Windows Remote Management (HTTPS-In)" dir=in action=allow protocol=TCP localport=$port
}

$winrmHttpsPort=5986

winrm set winrm/config '@{MaxEnvelopeSizekb = "8192"}'

Configure-WinRMHttpsListener $HostName $port

Add-FirewallException -port $winrmHttpsPort

Set-MpPreference -DisableRealtimeMonitoring $true
Install-PackageProvider -Name Nuget -Force -Confirm:$False -RequiredVersion 2.8.5.201


Set-ExecutionPolicy Bypass

New-Item -path "registry::hklm\software\policies\microsoft\Internet Explorer\Main" -Force
New-ItemProperty -path "registry::hklm\software\policies\microsoft\Internet Explorer\Main" -Name DisableFirstRunCustomize -PropertyType dword -Value 1
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -Value 0

if ($DevMachine) {
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
}
