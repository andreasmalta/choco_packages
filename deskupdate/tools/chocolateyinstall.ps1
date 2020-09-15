$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://webdownloads2.ts.fujitsu.com/download/FileDownload/fileDownload.aspx?SoftwareGUID=E47C0F3D-69DA-4EA8-86A7-DAD3861AE17E&FileFolder=Downloadfiles&FileTypeExtension=EXE&FileNameClient=FTS_DeskUpdateSetup_5010064_1238862.EXE&Token=NTkxPTE2NDY0MTY0MTY3HyA='

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'deskupdate*'
  checksum      = 'C8B60B88B27364D5AAC11689C4FE597B90E171ED6FFFBC85AC6E84DA91673388'
  checksumType  = 'sha256'
  silentArgs    = "/VERYSILENT"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
