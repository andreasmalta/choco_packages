$ErrorActionPreference = 'Stop';

$url = "https://www.brightsignnetwork.com/download/ba-connected-builds/ba-connected-prod/BA%20connected%20Setup%20" + $Env:ChocolateyPackageVersion + ".exe"
$checksum = 'F576BAEDECC4FCA4DAC6E592B80191C1557E0D567367600C09FE097036524311'

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
