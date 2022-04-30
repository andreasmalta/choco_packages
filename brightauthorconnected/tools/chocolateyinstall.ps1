$ErrorActionPreference = 'Stop';
$url            = 'https://brightsignnetwork.com/download/nsingh/ba-connected/BA%20connected%20Setup%201.7.7.exe'
$checksum_url   = '37CEEFFC968B44CA54CD4CFBFE475100BD6B1219B996D5D3A0AE103122EA2BA5'

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
