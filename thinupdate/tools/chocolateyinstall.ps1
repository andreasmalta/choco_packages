$ErrorActionPreference = 'Stop';

$url             = 'https://ftp.hp.com/pub/tcimages/EasyUpdate/AddOns/Win32/HPThinUpdate-02.06.22-Win32.msi'
$checksum        = 'F434A62FE92B203FBB22F0A9C4C825DDC115092B9419FBEB598F09862A0FECF4'

$url64           = 'https://ftp.hp.com/pub/tcimages/EasyUpdate/AddOns/Win64/HPThinUpdate-02.06.22-Win64.msi'
$checksum64      = '0FD00707AF35D1D12C9CD8F1E415D0F47EECDAFF5CB62203A9E53C32D9A7BDCB'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = $url
  checksum       = $checksum
  checksumType   = 'sha256'
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  softwareName   = 'hp thinupdate*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
