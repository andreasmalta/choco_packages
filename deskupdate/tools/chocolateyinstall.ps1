$ErrorActionPreference = 'Stop';
$url             = 'https://webdownloads3.ts.fujitsu.com/download/FileDownload/fileDownload.aspx?SoftwareGUID=2A321609-0FBB-480D-B331-0968AA886CC1&FileFolder=Downloadfiles&FileTypeExtension=EXE&FileNameClient=FTS_DeskUpdateSetup_5020030_1257366.EXE'
$checksum_url    = '260DA0BD1F9C1E6959256CC438D13E03C487479BAC05B4D0967EDCD16488FE3A'

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
