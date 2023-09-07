$ErrorActionPreference = 'Stop';

$url = "https://www.brightsignnetwork.com/download/ba-connected-builds/ba-connected-prod/BA%20connected%20Setup%20" + $Env:ChocolateyPackageVersion + ".exe"
$checksum = 'EA5D01AAEA6D57D833997C97525A379F501D21E3159562023F618B075F7130AB'

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
