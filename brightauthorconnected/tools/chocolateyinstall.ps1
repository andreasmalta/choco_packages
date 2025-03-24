$ErrorActionPreference = 'Stop';

$url = "https://downloads.bsn.cloud/BA+connected+Setup+1.55.1.exe"
$checksum = 'E27699A83AD967704F04A067CEDE4AF1521BB51C712617CD5C458584EBF38597'

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
