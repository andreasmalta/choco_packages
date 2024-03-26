$ErrorActionPreference = 'Stop';
$url = 'https://webdownloads2.ts.fujitsu.com/download/FileDownload/fileDownload.aspx?SoftwareGUID=A63621A0-4BE1-476E-9B86-309ADB82E0A8&FileFolder=Downloadfiles&FileTypeExtension=EXE&FileNameClient=FTS_DeskUpdateSetup_5020064_1295759.EXE'
$checksum = '2E4C6A201C0469D7BFFC809C111C4DDB6A16601B60EAB5F81088D658E75E0D59'

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
