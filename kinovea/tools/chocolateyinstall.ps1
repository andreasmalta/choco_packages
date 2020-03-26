
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url      = 'https://www.kinovea.org/setup/kinovea.0.9.1/Kinovea-0.9.1-x64.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  softwareName  = 'kinovea*'

  checksum      = 'B8BB787178E4804CCDDEF4144A70D76A94F34F5E06904C5DE906EC5C55EC5C53'
  checksumType  = 'sha256'

  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
