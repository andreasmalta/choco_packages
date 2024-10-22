$ErrorActionPreference = 'Stop';
$url = 'https://files.bbsoftware.co.uk/bbflbk5.exe'
$checksum = '8118F7637CEF1A3D9E95F2B32F3D70D8ADC7B5597F584BB6658BC914AB90D4BB'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'flashbackpro*'
  checksum      = $checksum
  checksumType  = 'sha256'
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
