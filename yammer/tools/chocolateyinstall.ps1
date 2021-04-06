$ErrorActionPreference = 'Stop';

$url             = 'https://yammerdesktopapp.blob.core.windows.net/binaries/dist/win32/ia32/Yammer-ia32-3.4.8.msi'
$checksum        = '279C05C788689447905F8D05134D4FB82D1910155116FB46DD3278F1A616B651'

$url64           = 'https://yammerdesktopapp.blob.core.windows.net/binaries/dist/win32/x64/Yammer-x64-3.4.8.msi'
$checksum64      = 'A6B7A2F41CC309E7D50F752F31C3DAE1D7F6A1E1E7A7FB4C691E5B713EE3332D'

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
