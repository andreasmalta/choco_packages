$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#1 DOWNLOAD
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2026/ACD/E55B46A2-B58D-3ABE-B345-8368D1AB33AA/SFX/SFX/ACD_2026_english_us_win_db_001_002.exe'
$checksum1 = '4636C37DC7E94C6CE7702F853CB8EF9C85DACA700E89C8AB49C7D22F188E5040'
$file = $env:TEMP + '\AutoCAD_2026_English_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2026/ACD/E55B46A2-B58D-3ABE-B345-8368D1AB33AA/SFX/ACD_2026_english_us_win_db_002_002.7z'
$checksum2 = '308D561E16A724335D47689EF065FD2C4224215FF168E7A4F21305888D7989BB'
$zip = $env:TEMP + '\AutoCAD_2026_English_Win_64bit_db_002_002.7z'
Get-ChocolateyWebFile -PackageName 'EXE package' -FileFullPath $file -Url $url1 -Checksum $checksum1 -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'ZIP package' -FileFullPath $zip -Url $url2 -Checksum $checksum2 -ChecksumType 'sha256'

#2 UNINSTALL OLD
. $toolsDir\helpers.ps1
Invoke-UninstallAutoCAD

#3 INSTALL
$packageArgs  = @{
  packageName    = 'AutoCAD'
  fileType       = 'exe'
  file           = $file
  softwareName   = 'AutoCAD*'
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
