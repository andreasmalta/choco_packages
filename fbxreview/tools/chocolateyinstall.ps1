$ErrorActionPreference = 'Stop';
$installdir     = Join-Path -Path $env:LocalAppData -ChildPath "Temp\1\chocolatey" | Join-Path -ChildPath $env:ChocolateyPackageName | Join-Path -ChildPath $env:ChocolateyPackageVersion
$altinstalldir  = Join-Path -Path $env:LocalAppData -ChildPath "Temp\chocolatey" | Join-Path -ChildPath $env:ChocolateyPackageName | Join-Path -ChildPath $env:ChocolateyPackageVersion

$url            = 'https://dl2.filehorse.com/win/imaging-and-digital-photo/autodesk-fbx-review/Autodesk-FBX-Review-1.5.0.0.exe?st=ZuFLktIQ2FVW_RDt6eNlPw&e=1615791965&fn=fbx-review-installer.exe'
$checksum_url   = 'C87887125A61FF3BCA636BBEC495E3BAE64AFAE27E4492E4DC2907ECB9F7BD14'
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
$packageArgsMSI = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "/qn /norestart"
  validExitCodes= @(0, 3010, 1641)
  softwareName  = 'FBX Review*'
  file          = $msi
}
Install-ChocolateyPackage @packageArgsMSI
