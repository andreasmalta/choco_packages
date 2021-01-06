$ErrorActionPreference = 'Stop';
$installdir     = Join-Path -Path $env:LocalAppData -ChildPath "Temp\1\chocolatey" | Join-Path -ChildPath $env:ChocolateyPackageName | Join-Path -ChildPath $env:ChocolateyPackageVersion
$altinstalldir  = Join-Path -Path $env:LocalAppData -ChildPath "Temp\chocolatey" | Join-Path -ChildPath $env:ChocolateyPackageName | Join-Path -ChildPath $env:ChocolateyPackageVersion

$url            = 'https://dl2.filehorse.com/win/imaging-and-digital-photo/autodesk-fbx-review/Autodesk-FBX-Review-1.4.1.0.exe?st=aKOViE1w1uwDLh30NssG-g&e=1609941002&fn=Autodesk_FBX_Review_Win_64bit.exe'
$checksum_url   = '37DA722D4F77C902F0F68535DA959DB25A8F1D2C3F673CA1ADC2EBF55C73A546'
$packageArgsURL = @{
  packageName   = $env:ChocolateyPackageName
  unziplocation = $installdir
  url           = $url
  checksum      = $checksum_url
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgsURL
Get-ChildItem $installdir | Copy-Item -Destination $altinstalldir -Recurse -Force

$msi            = Join-Path $installdir 'fbxreview.msi'
$checksum_msi   = '3B756DA81BA6DE74797A86906CD04B4A11018596D08DFE4BA6A114539C265597'
$packageArgsMSI = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "/qn /norestart"
  validExitCodes= @(0, 3010, 1641)
  softwareName  = 'FBX Review*'
  file          = $msi
  checksum      = $checksum_msi
  checksumType  = 'sha256'
}
Install-ChocolateyPackage @packageArgsMSI
