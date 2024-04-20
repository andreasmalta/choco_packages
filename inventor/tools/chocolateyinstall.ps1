$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#1 DOWNLOAD
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/INVPROSA/E578CB4E-CF55-3E4D-9A8A-213245140B78/SFX/Inventor_Professional_2025_English_Win_64bit_db_001_002.exe'
$checksum1 = 'AC42F4C5845A3248A124BC206228C56BD6C49258D0491A59700F28214E41E9B7'
$file = $env:TEMP + '\Inventor_Professional_2025_English_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/INVPROSA/E578CB4E-CF55-3E4D-9A8A-213245140B78/SFX/Inventor_Professional_2025_English_Win_64bit_db_002_002.7z'
$checksum2 = '105BAA282929203763E9DD87F2FD0A9AC4A364FE9BB7967955874B5482740B4F'
$zip = $env:TEMP + '\Inventor_Professional_2025_English_Win_64bit_db_002_002.7z'
Get-ChocolateyWebFile -PackageName 'EXE package' -FileFullPath $file -Url $url1 -Checksum $checksum1 -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'ZIP package' -FileFullPath $zip -Url $url2 -Checksum $checksum2 -ChecksumType 'sha256'

#2 UNINSTALL OLD
. $toolsDir\helpers.ps1
Invoke-UninstallInventor

#3 INSTALL
$packageArgs  = @{
  packageName    = 'Inventor'
  fileType       = 'exe'
  file           = $file
  softwareName   = 'Inventor*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
