$ErrorActionPreference = 'Stop';
$url             = 'https://webdownloads2.ts.fujitsu.com/download/FileDownload/fileDownload.aspx?SoftwareGUID=5345FCD8-3F02-4199-90AD-22269D958EF8&FileFolder=Downloadfiles&FileTypeExtension=EXE&FileNameClient=FTS_DeskUpdateSetup_5020027_1249345.EXE'
$checksum_url    = '285641F909F12552068BDEBF3BF8F78F9916331356101B23A563DD9B16C577BC'

$packageArgs     = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'deskupdate*'
  unzipLocation  = $env:TEMP
  fileType       = 'exe'
  url            = $url
  checksum       = $checksum_url
  checksumType   = 'sha256'
  silentArgs     = "/VERYSILENT"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
