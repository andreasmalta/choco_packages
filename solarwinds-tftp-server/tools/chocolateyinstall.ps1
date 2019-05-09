$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url      = 'https://downloads.solarwinds.com/solarwinds/Release/FreeTool/SolarWinds-TFTP-Server.zip'
$checksum_url    = 'BBDC2D1FDCCEBB445F972480675DF732A674FC86671EBE7107161D8DAA3DFA14'
$extract = Join-Path $toolsDir 'setup'
$file = Join-Path $toolsDir 'setup\TFTP-Server-Installer.exe'
$checksum_file    = 'EC61640CA19CD915B264058198237802477D3B44B4D62B35A654087AA31B8C03'

$packageArgs1 = @{
  packageName   = $env:ChocolateyPackageName
  url           = $url
  checksum      = $checksum_url
  checksumType  = 'sha256'
  unziplocation = $extract
}
Install-ChocolateyZipPackage @packageArgs1

$packageArgs2 = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $file
  softwareName  = 'SolarWinds TFTP Server*'
  checksum      = $checksum_file
  checksumType  = 'sha256'
  silentArgs    = "/S /R"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs2
