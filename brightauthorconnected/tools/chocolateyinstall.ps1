$ErrorActionPreference = 'Stop';
$url = 'https://www.brightsignnetwork.com/download/ba-connected-builds/ba-connected-prod/BA%20connected%20Setup%201.8.3.exe'
$checksum = '973A640EBD6F91A3587E730759FBCBC4DE08E1BB9859598E660C3A137CDAF8DF'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'BAconnected*'
  checksum      = $checksum
  checksumType  = 'sha256'
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
