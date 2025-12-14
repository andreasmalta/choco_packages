$ErrorActionPreference = 'Stop';

#1 URL
#$url = "https://up.autodesk.com/2017/CDX/AB4AADCC-F890-4B4F-A7A6-B0FBD2386796/DesktopConnector-x64.exe"
$url = "https://up.autodesk.com/2017/CDX/AB4AADCC-F890-4B4F-A7A6-B0FBD2386796/DesktopConnector-x64-" + $Env:ChocolateyPackageVersion + ".exe"
$checksum = '30690B313257A4C19B6E82F54E99C468D351D93041287383043A33384777884A'

#2 INSTALL
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

#3 WAIT UNTIL INSTALLED
Write-Host "Waiting for Autodesk Installer to finish..."
Start-Sleep 300
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

#4 Close software running in elevated mode
Start-Sleep 30
Stop-Process -Name "DesktopConnector*" -Force
