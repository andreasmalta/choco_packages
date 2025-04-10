$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#1 DOWNLOAD
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2026/RVT/8986CA21-EA9C-32F3-A1DB-C34BD2BDA7A5/SFX/RVT_2026_NA_win_db_001_002.exe'
$checksum1 = '24615FD6EAE2A8C66B8F50E3808EDD9726175345E4A75AAE65B437624C2C8409'
$file = $env:TEMP + '\RVT_2026_NA_win_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2026/RVT/8986CA21-EA9C-32F3-A1DB-C34BD2BDA7A5/SFX/RVT_2026_NA_win_db_002_002.7z'
$checksum2 = '83CCDBD05DD98B8E216B527B8B8169B2FAB5A87680F0F6A490D7F96B927DEE96'
$zip = $env:TEMP + '\RVT_2026_NA_win_db_002_002.7z'
Get-ChocolateyWebFile -PackageName 'EXE package' -FileFullPath $file -Url $url1 -Checksum $checksum1 -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'ZIP package' -FileFullPath $zip -Url $url2 -Checksum $checksum2 -ChecksumType 'sha256'

#2 UNINSTALL OLD
. $toolsDir\helpers.ps1
Invoke-UninstallOLD

#3 INSTALL
$packageArgs  = @{
  packageName    = 'Revit'
  fileType       = 'exe'
  file           = $file
  softwareName   = 'Revit*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs

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
