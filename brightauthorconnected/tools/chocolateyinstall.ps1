$ErrorActionPreference = 'Stop';
$url = 'https://www.brightsignnetwork.com/download/ba-connected-builds/ba-connected-prod/BA%20connected%20Setup%201.13.0.exe'
$checksum = '755DEDD981B9571E737BDACEE74997F1C94245D0E6204AD5BAD70204BABD1AF6'

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
