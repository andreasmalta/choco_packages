$ErrorActionPreference = 'Stop';
$url            = 'https://brightsignnetwork.com/download/gostosh/ba-connected/BAconnected-Setup-1.6.16.exe'
$checksum_url   = '4D8CD437C402071482F35DBE8753E5FD87E7292AD8A7B1EC0CF32A0626B834D4'

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
