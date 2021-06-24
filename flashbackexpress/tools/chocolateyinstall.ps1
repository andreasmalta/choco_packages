$ErrorActionPreference = 'Stop';
$url            = 'https://files.bbsoftware.co.uk/bbfbex5.exe'
$checksum       = '745CFB7EEDF6B763E24FF94BF1E83F71BA843FE987D25F0244709ADB2A38AE48'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'flashbackexpress*'
  checksum      = $checksum
  checksumType  = 'sha256'
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
