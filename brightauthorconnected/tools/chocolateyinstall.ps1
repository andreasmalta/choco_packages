$ErrorActionPreference = 'Stop';
$url = 'https://www.brightsignnetwork.com/download/ba-connected-builds/ba-connected-prod/BA%20connected%20Setup%201.11.1.exe'
$checksum = 'BBA2D39A112AD36D9EDC3E0DCE2EA3680BA5FAB3DCF7D3B3EE317E0D23DA96BB'

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
