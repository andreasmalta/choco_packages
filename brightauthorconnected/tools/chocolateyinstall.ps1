$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url      = 'https://brightsignnetwork.com/download/gostosh/ba-connected/BAconnected-Setup-1.6.6.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'BAconnected*'
  checksum      = 'D60BC066A2D6C32322573A298D366D34E54A1523DEFE4049F9D5CCA701F87004'
  checksumType  = 'sha256'
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
