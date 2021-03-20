$ErrorActionPreference = 'Stop';
$url            = 'https://brightsignnetwork.com/download/skhan/ba-connected/BA-connected-Setup-1.6.29.exe'
$checksum_url   = '311A0AF528D8DF37EF7BC05799AAC39DB574A8B74C2FE605F4EC2FF590BC6DB9'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $env:TEMP
  fileType      = 'exe'
  url           = $url
  softwareName  = 'BAconnected*'
  checksum      = $checksum_url
  checksumType  = 'sha256'
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
