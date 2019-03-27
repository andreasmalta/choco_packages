$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'ftp://ftp.avigilon.com/ACC/ACC_6.14.4.6/AvigilonControlCenterClient-6.14.4.6.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'acc6client*'
  checksum      = '2567665A4AC01474D506E0B6EDA1A4E5311ABF72BC4552A3724D0AB0A2D94F59'
  checksumType  = 'sha256'
  silentArgs    = "/s"
}

Install-ChocolateyPackage @packageArgs
