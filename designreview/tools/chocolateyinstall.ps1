$ErrorActionPreference = 'Stop';

$url = "https://download.autodesk.com/us/support/files/designreview/2024/designreview-installer_en.exe"
$checksum = '0D60D24A033820C80FD4BAE9406CF98DAA8D013E2331E794E297CE321AFEF2EC'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'Design Review*'
  checksum      = $checksum
  checksumType  = 'sha256'
  silentArgs    = "-q"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
