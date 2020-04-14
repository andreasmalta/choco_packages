$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'DWGTrueView*'

$packageArgs2020 = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "{28B89EEF-3028-0409-0100-CF3F3A09B77D} /qn /norestart"
}

$packageArgs2021 = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "{28B89EEF-4128-0409-0100-CF3F3A09B77D} /qn /norestart"
}

Uninstall-ChocolateyPackage @packageArgs2020
Uninstall-ChocolateyPackage @packageArgs2021
Remove-Item $fileLocation -Recurse -Force -ErrorAction Ignore
