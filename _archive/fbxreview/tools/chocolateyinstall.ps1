$ErrorActionPreference = 'Stop';
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url            = 'https://softpedia-secure-download.com/dl/cc350a59e413b41f3944f2a0114a6c8d/60573631/100246329/software/multimedia/graphic/Autodesk_FBX_Review_Win_64bit.exe'
$checksum_url   = 'C87887125A61FF3BCA636BBEC495E3BAE64AFAE27E4492E4DC2907ECB9F7BD14'

#remove version 1.4.1 before upgrading
$fbxreviewpath = "C:\Program Files\Autodesk\FBX Review\fbxreview.exe"
if (Test-Path $fbxreviewpath -PathType leaf) {
$fbxreviewversion = [version](Get-Command $fbxreviewpath).FileVersionInfo.FileVersion
if($fbxreviewversion -eq "1.4.1.0") {
Uninstall-ChocolateyPackage -PackageName $env:ChocolateyPackageName -FileType 'msi' -SilentArgs "{689A5161-B50F-45F3-8434-E87790E26D9C} /qn /norestart" -ValidExitCodes @(0, 3010, 1605, 1614, 1641) -File ""}
}

#1.5.0 install not silent, using autohotkey script
$ahkFile = Join-Path $toolsDir 'chocolateyinstall.ahk'
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
