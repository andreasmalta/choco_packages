$ErrorActionPreference = 'Stop';
$download       = 'https://ftp.hp.com/pub/softpaq/sp112501-113000/sp112517.exe'
$checksum       = '22C97A9269395072950037B58C76AD63ACD702D7AEA3152DA2B24F6890EE554C'

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
