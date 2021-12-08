$ErrorActionPreference = 'Stop';
$url            = 'https://brightsignnetwork.com/download/nsingh/ba-connected/BA%20connected%20Setup%201.6.52.exe'
$checksum_url   = 'E83DE4B0B0AD64AA10330B4F683B26E8ED0D3641AC1936CC274C60BE777B7F99'

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
