$ErrorActionPreference = 'Stop';

$url             = 'https://yammerdesktopapp.blob.core.windows.net/binaries/dist/win32/ia32/Yammer-ia32-3.4.9.msi'
$checksum        = 'C275984AD0506BF8323CABED3C180585B5A2FB412DE37A4B13898C408CEF1F48'

$url64           = 'https://yammerdesktopapp.blob.core.windows.net/binaries/dist/win32/x64/Yammer-x64-3.4.9.msi'
$checksum64      = '28B7688E7BEB8D444EF9F3AA292065BAF16949E8AE33B9C89F76D8F732933149'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = $url
  checksum       = $checksum
  checksumType   = 'sha256'
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  softwareName   = 'yammer*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
