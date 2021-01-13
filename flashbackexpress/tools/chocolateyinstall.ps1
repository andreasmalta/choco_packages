$ErrorActionPreference = 'Stop';
$url        = 'http://files.bbsoftware.co.uk/bbfbex5.exe'
$checksum_url   = '4D975D184BA1012F4E97020D7317DC31A45193CB3433CC7162624BA46ECA8AAA'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $env:TEMP
  fileType      = 'exe'
  url           = $url
  softwareName  = 'flashbackexpress*'
  checksum      = $checksum_url
  checksumType  = 'sha256'
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
