$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#1 DOWNLOAD & EXTRACT
$url = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2026/ACDLT/09E544DA-5EFC-3B5B-9E50-689C464B492B/SFX/ACDLT_2026_english_us_win_db_002_002.7z'
$checksum = 'F728CED60DA133876A3311FAA240384590A2EF144C4C0CD9553FD5C7ED143A93'
$tempversion = Join-Path $env:TEMP (Join-Path $env:ChocolateyPackageName $env:ChocolateyPackageVersion)
$packageArgsUnzip = @{
  packageName    = 'ACDLT Installation Files'
  url            = $url
  checksum       = $checksum
  checksumType   = 'sha256'
  unziplocation  = $tempversion
}
Install-ChocolateyZipPackage @packageArgsUnzip

#2 UNINSTALL OLD
. $toolsDir\helpers.ps1
Invoke-UninstallOld

#3 INSTALL
$setup = Join-Path $tempversion 'setup.exe'
$packageArgs  = @{
  packageName    = 'AutoCAD LT'
  fileType       = 'exe'
  file           = $setup
  softwareName   = 'AutoCAD LT*'
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
