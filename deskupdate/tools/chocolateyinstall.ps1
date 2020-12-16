$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://webdownloads3.ts.fujitsu.com/download/FileDownload/fileDownload.aspx?SoftwareGUID=ADB78416-CEC6-4914-83AB-81244A2A2939&FileFolder=Downloadfiles&FileTypeExtension=EXE&FileNameClient=FTS_DeskUpdateSetup_5020026_1244560.EXE'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'deskupdate*'
  checksum      = 'F9E97B9B289E56F5E54B44D934A59E0D5BA78A4618BD91149C231C5CF1483ABE'
  checksumType  = 'sha256'
  silentArgs    = "/VERYSILENT"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
