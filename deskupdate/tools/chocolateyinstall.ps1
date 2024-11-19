$ErrorActionPreference = 'Stop';
$url = 'https://webdownloads4.ts.fujitsu.com/download/FileDownload/fileDownload.aspx?SoftwareGUID=B5E72ADE-22A9-46DA-8B53-5BCEF566F2B8&FileFolder=Downloadfiles&FileTypeExtension=EXE&FileNameClient=FTS_DeskUpdateSetup_5020074_1302475.EXE'
$checksum = 'CC18DC31D5294C50E14EF4AD9E40F80BB08C3EF986A3692BE267AC772ACF4046'

$packageArgs     = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'deskupdate*'
  unzipLocation  = $env:TEMP
  fileType       = 'exe'
  url            = $url
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = "/VERYSILENT"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
