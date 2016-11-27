. $env:USERPROFILE\Documents\WindowsPowerShell\Get-MOTD.ps1
Get-MOTD
write-host ""
write-host ""
$fc = ((Invoke-WebRequest https://gdgnoco-fortune.appspot.com/api/fortune).content) | ConvertFrom-Json
write-host `t `"$($fc.fortune)`"
write-host ""

Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)
Import-Module posh-git

# Set up a simple prompt, adding the git prompt parts inside git repos
function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE

    Write-Host($pwd.ProviderPath) -nonewline

    Write-VcsStatus

    $global:LASTEXITCODE = $realLASTEXITCODE
    return "> "
}

Pop-Location

Start-SshAgent -Quiet

cd ~