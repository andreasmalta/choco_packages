$ErrorActionPreference = 'Stop';
$url = 'https://webdownloads4.ts.fujitsu.com/download/FileDownload/fileDownload.aspx?SoftwareGUID=F3B75570-7BC3-48DD-8F87-D7EBBF8CBEA7&FileFolder=Downloadfiles&FileTypeExtension=EXE&FileNameClient=FTS_DeskUpdateSetup_5020075_1304142.EXE'
$checksum = 'DDD6883A041020B89909927155531E115441C337ACBC3CA126787EC250D36682'

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
