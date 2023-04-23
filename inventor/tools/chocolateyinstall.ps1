$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#UNINSTALL OLD VERSIONS
. $toolsDir\helpers.ps1
Invoke-UninstallOld

#DOWNLOAD
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/INVPROSA/0B739F57-E75B-3A3D-B2A3-BFB7B2346754/SFX/Inventor_Pro_2024_English_Win_64bit_Dlm_001_003.sfx.exe'
$checksum1 = '8682FB60093D1A9B2366890B05CDF7DAA0B470018F9B93D87E260F1158366201'
$part1 = $env:TEMP + '\Inventor_Pro_2024_English_Win_64bit_Dlm_001_003.sfx.exe'
Get-ChocolateyWebFile -PackageName 'AutoCAD Download Part 1' -FileFullPath $part1 -Url $url1 -Checksum $checksum1 -ChecksumType 'sha256'

$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/INVPROSA/0B739F57-E75B-3A3D-B2A3-BFB7B2346754/SFX/Inventor_Pro_2024_English_Win_64bit_Dlm_002_003.sfx.exe'
$checksum2 = 'D2AB77925B3B31A5F9E716558ED990EBE1F5D71AFE47EB465E02304D289EA342'
$part2 = $env:TEMP + '\Inventor_Pro_2024_English_Win_64bit_Dlm_002_003.sfx.exe'
Get-ChocolateyWebFile -PackageName 'AutoCAD Download Part 2' -FileFullPath $part2 -Url $url2 -Checksum $checksum2 -ChecksumType 'sha256'

$url3 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/INVPROSA/0B739F57-E75B-3A3D-B2A3-BFB7B2346754/SFX/Inventor_Pro_2024_English_Win_64bit_Dlm_003_003.sfx.exe'
$checksum3 = '99CA5A64347666FC20A4B79965517E3887AFC8446E314FB8624D41CDAB7BF8C8'
$part3 = $env:TEMP + '\Inventor_Pro_2024_English_Win_64bit_Dlm_003_003.sfx.exe'
Get-ChocolateyWebFile -PackageName 'AutoCAD Download Part 3' -FileFullPath $part3 -Url $url3 -Checksum $checksum3 -ChecksumType 'sha256'

#EXTRACT
$packageArgsUnzip  = @{
  packageName    = 'Inventor Installation Files'
  fileType       = 'exe'
  file           = $part1
  softwareName   = 'Inventor Installation Files*'
  silentArgs     = "-suppresslaunch -d $env:TEMP"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsUnzip

#INSTALL
$file = $env:TEMP + '\Inventor_Pro_2024_English_Win_64bit_Dlm\Setup.exe'
$packageArgs  = @{
  packageName    = 'Inventor'
  fileType       = 'exe'
  file           = $file
  softwareName   = 'Inventor*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
