$ErrorActionPreference = 'Stop';

#support assistant upgrade & uninstallation is not silent
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  silentArgs    = '/s /v /qn'
  file			= 'C:\Program Files (x86)\Hewlett-Packard\HP Support Framework\UninstallHPSA.exe'
}
Uninstall-ChocolateyPackage @packageArgs
