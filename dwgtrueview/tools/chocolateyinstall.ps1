$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#1 LANGUAGE SELECTION
$pp = Get-PackageParameters
if ($pp.'French') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2027/PLC0000037/D4ECFC6C-9FEC-3228-A071-2F094F7AC212/SFX/TrueView_2027_french_db_002_002.7z'
$checksum = '80F60A0BD1536C81F48469647E7D3EF86E3D82BA7C146A5F4C55EABAC2E27D3D'
}

elseif ($pp.'Japanese') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2027/PLC0000037/EE646859-D80A-3A3D-BDFC-848C255701C7/SFX/TrueView_2027_japanese_db_002_002.7z'
$checksum = '080712CC64649A9690AAD68F78D3A0FC578B7EF1ED492C9846FC7979A146BB75'
}

else {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2027/PLC0000037/045D668C-3014-35D6-A2BE-4C82327A8A3E/SFX/TrueView_2027_english_us_db_002_002.7z'
$checksum = '2AC71E81F70BEB185C33DF580EDF5A7DD28E0E0C7A954D02EC0DB5EECC2FAA0A'
}

#2 DOWNLOAD & EXTRACT
$tempversion = Join-Path $env:TEMP (Join-Path $env:ChocolateyPackageName $env:ChocolateyPackageVersion)
$packageArgsUnzip = @{
  packageName    = 'DWG TrueView Installation Files'
  url            = $url
  checksum       = $checksum
  checksumType   = 'sha256'
  unziplocation  = $tempversion
}
Install-ChocolateyZipPackage @packageArgsUnzip

#3 UNINSTALL OLD
. $toolsDir\helpers.ps1
Invoke-UninstallOld

#4 INSTALL
$setup = Join-Path $tempversion 'setup.exe'
$packageArgs  = @{
  packageName    = 'DWG TrueView'
  fileType       = 'exe'
  file           = $setup
  softwareName   = 'DWG TrueView*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs

#5 WAIT UNTIL INSTALLED
Write-Host "Waiting for Autodesk Installer to finish..."
Start-Sleep 120
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
