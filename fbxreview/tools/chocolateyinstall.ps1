$ErrorActionPreference = 'Stop';
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url            = 'https://dl2.filehorse.com/win/imaging-and-digital-photo/autodesk-fbx-review/Autodesk-FBX-Review-1.5.0.0.exe?st=ZuFLktIQ2FVW_RDt6eNlPw&e=1615791965&fn=fbx-review-installer.exe'
$checksum_url   = 'C87887125A61FF3BCA636BBEC495E3BAE64AFAE27E4492E4DC2907ECB9F7BD14'

$ahkFile = Join-Path $toolsDir 'fbx-review-installer.ahk'
$ahkEXE = Get-ChildItem "$env:ChocolateyInstall\lib\autohotkey.portable" -Recurse -filter autohotkey.exe

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  checksum      = $checksum_url
  checksumType  = 'sha256'
  softwareName  = 'autodeskfbxreview*'
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}
Start-Process $ahkEXE $ahkFile
Install-ChocolateyPackage @packageArgs
