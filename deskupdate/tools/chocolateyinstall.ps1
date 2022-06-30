$ErrorActionPreference = 'Stop';
$url             = 'https://webdownloads4.ts.fujitsu.com/download/FileDownload/fileDownload.aspx?SoftwareGUID=9105CDDF-323F-483B-8C80-B9A62182FA3B&FileFolder=Downloadfiles&FileTypeExtension=EXE&FileNameClient=FTS_DeskUpdateSetup_5020040_1268978.EXE'
$checksum_url    = 'B46CB8E525FC63D777C52C11306640FB20F829D1200424EFD59DDD381F4258C3'

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
