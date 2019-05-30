$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'ftp://ftp.avigilon.com/ACC/ACC_6.14.6.30/AvigilonControlCenterClient-6.14.6.30.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'acc6client*'
  checksum      = '22210EF8BAA6EABCE6F0EA84D296AFA2B2F6E3DAA6525C6FA5059A3A123B2C50'
  checksumType  = 'sha256'
  silentArgs    = "/s"
}

Install-ChocolateyPackage @packageArgs
