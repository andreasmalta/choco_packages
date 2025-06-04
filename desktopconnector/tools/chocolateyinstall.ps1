$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#1 URL
#$url = "https://up.autodesk.com/2017/CDX/AB4AADCC-F890-4B4F-A7A6-B0FBD2386796/DesktopConnector-x64-" + $Env:ChocolateyPackageVersion + ".exe"
$url = "https://up.autodesk.com/2017/CDX/AB4AADCC-F890-4B4F-A7A6-B0FBD2386796/DesktopConnector-x64.exe"
$checksum = '1BDD365C4D63ACE4638D83557BFE90CA46301E78CF98541947793080475EFAA4'

#2 UNINSTALL 15
. $toolsDir\helpers.ps1
Invoke-Uninstall15

#3 INSTALL
$packageArgs = @{
  packageName    = 'Autodesk Desktop Connector'
  fileType       = 'exe'
  url            = $url
  softwareName   = 'Autodesk Desktop Connector*'
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs

#4 WAIT UNTIL INSTALLED
Write-Host "Waiting for Autodesk Installer to finish, trying again in 30 seconds..."
Start-Sleep 30
while ($true) {
    # (re)try
    $processCHK = Get-Process | Where {$_.ProcessName -Like 'Installer'}
    if ($processCHK -eq $null)
    {
        Write-Host "Autodesk Installer ready!"
		# exit the loop
        break;
    }
    # wait
    Write-Host "Waiting for Autodesk Installer to finish, trying again in 30 seconds..."
    Start-Sleep 30
}

#5 Close software running in elevated mode
Start-Sleep 30
Stop-Process -Name "DesktopConnector*" -Force
