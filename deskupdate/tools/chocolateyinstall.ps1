$ErrorActionPreference = 'Stop';
$url             = 'https://webdownloads2.ts.fujitsu.com/download/FileDownload/fileDownload.aspx?SoftwareGUID=81428530-BA47-4E87-813E-905E7230CCEC&FileFolder=Downloadfiles&FileTypeExtension=EXE&FileNameClient=FTS_DeskUpdateSetup_5020037_1257531.EXE'
$checksum_url    = 'A47E19EB3B6A7CE218125812F5661E411E80935A8F821FB614A70416CEB4BDF0'

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
