$ErrorActionPreference = 'Stop';
$download       = 'https://ftp.ext.hp.com/pub/softpaq/sp114001-114500/sp114031.exe'
$checksum       = 'AD57B919E8BB0384502310ACC5E71B6C091BB5E835C7CD6B0319F0BBBFCD6704'

$extract        = Join-Path $env:TEMP 'extract'
$packageArgsURL = @{
  packageName   = $env:ChocolateyPackageName
  url           = $download
  checksum      = $checksum
  checksumType  = 'sha256'
  unziplocation = $extract
}
Install-ChocolateyZipPackage @packageArgsURL

$setup1         = Join-Path $extract 'setup.exe'
$installdir     = Join-Path -Path $env:LocalAppData -ChildPath "Temp\1\chocolatey" | Join-Path -ChildPath $env:ChocolateyPackageName | Join-Path -ChildPath $env:ChocolateyPackageVersion
$altinstalldir  = Join-Path -Path $env:LocalAppData -ChildPath "Temp\chocolatey" | Join-Path -ChildPath $env:ChocolateyPackageName | Join-Path -ChildPath $env:ChocolateyPackageVersion
$packageArgsExtract = @{
  packageName   = $env:ChocolateyPackageName
  file          = $setup1
  unziplocation = $installdir
}
Install-ChocolateyZipPackage @packageArgsExtract
Get-ChildItem $installdir | Copy-Item -Destination $altinstalldir -Recurse -Force

$setup2         = Join-Path $installdir 'setup.exe'
$packageArgsInstall = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $setup2
  softwareName  = 'hp pc hardware diagnostics*'
  silentArgs    = "/qn"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgsInstall
