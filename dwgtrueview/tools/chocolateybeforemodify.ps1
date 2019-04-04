$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'DWGTrueView*'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "{28B89EEF-2028-0409-0100-CF3F3A09B77D} /qn /norestart"
}

Uninstall-ChocolateyPackage @packageArgs
Remove-Item $fileLocation -Recurse -Force -ErrorAction Ignore
