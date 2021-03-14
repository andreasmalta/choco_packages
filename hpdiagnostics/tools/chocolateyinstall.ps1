$ErrorActionPreference = 'Stop';
$installdir     = Join-Path -Path $env:LocalAppData -ChildPath "Temp\1\chocolatey" | Join-Path -ChildPath $env:ChocolateyPackageName | Join-Path -ChildPath $env:ChocolateyPackageVersion
$copyinstall  = Join-Path -Path $env:LocalAppData -ChildPath "Temp\chocolatey" | Join-Path -ChildPath $env:ChocolateyPackageName | Join-Path -ChildPath $env:ChocolateyPackageVersion

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$download       = 'https://ftp.hp.com/pub/softpaq/sp112501-113000/sp112517.exe'
$checksum       = '22C97A9269395072950037B58C76AD63ACD702D7AEA3152DA2B24F6890EE554C'

$packageArgsURL = @{
  packageName   = $env:ChocolateyPackageName
  url           = $download
  checksum      = $checksum
  checksumType  = 'sha256'
  unziplocation = $toolsDir
}
Install-ChocolateyZipPackage @packageArgsURL

$extract1       = Join-Path $toolsDir 'setup.exe'
$packageArgsExtract = @{
  packageName   = $env:ChocolateyPackageName
  file          = $extract1
  unziplocation = $installdir
}
Install-ChocolateyZipPackage @packageArgsExtract

Get-ChildItem $installdir | Copy-Item -Destination $copyinstall -Recurse -Force
$extract2       = Join-Path $installdir 'setup.exe'
$packageArgsInstall = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $extract2
  softwareName  = 'hp pc hardware diagnostics*'
  silentArgs    = "/qn"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgsInstall
