$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#1 DOWNLOAD
$url1 = 'https://dds.autodesk.com/NetSWDLD/ODIS/prd/2025/NAVFREE/D3B0AE93-EFDC-396F-8A81-AAA853DF7637/SFX/Autodesk_Navisworks_Freedom_2025_Win_64bit_db_001_002.exe'
$checksum1 = '4B8DB2FA87F0B6DAE7589DAEEFD5F24D85B3057FC5796BFA79B0D453AF429336'
$file = $env:TEMP + '\Autodesk_Navisworks_Freedom_2025_Win_64bit_db_001_002.exe'
Get-ChocolateyWebFile -PackageName 'EXE package' -FileFullPath $file -Url $url1 -Checksum $checksum1 -ChecksumType 'sha256'

$url2 = 'https://dds.autodesk.com/NetSWDLD/ODIS/prd/2025/NAVFREE/D3B0AE93-EFDC-396F-8A81-AAA853DF7637/SFX/Autodesk_Navisworks_Freedom_2025_Win_64bit_db_002_002.7z'
$checksum2 = 'CB56B76A93448F02D12FDFAC1957F597F32C5911ECDABB6B886902FF1D60BC07'
$zip = $env:TEMP + '\Autodesk_Navisworks_Freedom_2025_Win_64bit_db_002_002.7z'
Get-ChocolateyWebFile -PackageName 'ZIP package' -FileFullPath $zip -Url $url2 -Checksum $checksum2 -ChecksumType 'sha256'

#2 UNINSTALL OLD VERSIONS
. $toolsDir\helpers.ps1
Invoke-UninstallOld

#3 INSTALL
$packageArgs  = @{
  packageName    = 'Navisworks Freedom'
  fileType       = 'exe'
  file           = $file
  softwareName   = 'Navisworks Freedom*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
