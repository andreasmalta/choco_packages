$ErrorActionPreference = 'Stop';
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ahkFile = Join-Path $toolsDir 'chocolateybeforemodify.ahk'
$ahkEXE = Get-ChildItem "$env:ChocolateyInstall\lib\autohotkey.portable" -Recurse -filter autohotkey.exe

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = 'C:\Program Files\Autodesk\FBX Review\uninstall.exe'
  silentArgs    = '/S'
}
Start-Process $ahkEXE $ahkFile
Uninstall-ChocolateyPackage @packageArgs

#remove older version 1.4.1
$test141 = test-path -path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{689A5161-B50F-45F3-8434-E87790E26D9C}"
if(-not($test141)){
$packageArgs141 = @{
packageName   = $env:ChocolateyPackageName
fileType      = 'msi'
silentArgs    = "{689A5161-B50F-45F3-8434-E87790E26D9C} /qn /norestart"
}
Uninstall-ChocolateyPackage @packageArgs141
}
