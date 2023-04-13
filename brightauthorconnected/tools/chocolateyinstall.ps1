$ErrorActionPreference = 'Stop';
$url = 'https://www.brightsignnetwork.com/download/ba-connected-builds/ba-connected-prod/BA%20connected%20Setup%201.10.0.exe'
$checksum = '2CAEFEA3BA54D4220081A49E69B7AD76DE57D7B05BEAA5A7F3CD0DFE43E6B5CC'

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
