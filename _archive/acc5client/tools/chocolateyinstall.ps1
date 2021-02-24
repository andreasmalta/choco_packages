$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'ftp://ftp.avigilon.com/ACC/ACC_5.10.24.2/AvigilonControlCenterClient-5.10.24.2.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  softwareName  = 'acc5client*'

  checksum      = 'F9380076060FA2316861EBBC0D0E1C0E25A8068DAE059D9C46598CEFE78F9898'
  checksumType  = 'sha256'

  silentArgs    = "/s"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
