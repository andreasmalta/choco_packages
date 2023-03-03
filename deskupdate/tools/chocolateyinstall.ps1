$ErrorActionPreference = 'Stop';
$url = 'https://webdownloads4.ts.fujitsu.com/download/FileDownload/fileDownload.aspx?SoftwareGUID=FE7260C7-0B8E-46D5-8EEF-613E9DBB09CC&FileFolder=Downloadfiles&FileTypeExtension=EXE&FileNameClient=FTS_DeskUpdateSetup_5020056_1279825.EXE'
$checksum = 'AD38663E34B616F81EB6A78750C9051C8967DBFD987E717BC76DC821C87A5155'

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
