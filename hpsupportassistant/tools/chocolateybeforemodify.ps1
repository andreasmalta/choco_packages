$ErrorActionPreference = 'Stop';

$folderlong = 'C:\Program Files (x86)\Hewlett-Packard\HP Support Framework\UninstallHPSA.exe'
$foldershort = 'C:\Program Files (x86)\HP\HP Support Framework\UninstallHPSA.exe'
if (Test-path $folderlong) { $file = $folderlong }
if (Test-path $foldershort) { $file = $foldershort }

#support assistant upgrade & uninstallation is not silent
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  silentArgs    = '/s /v /qn'
  file			= $file
}
Uninstall-ChocolateyPackage @packageArgs
