$ErrorActionPreference = 'Stop';
#we are removing all packages named with a yearly release to prepare for the upgrade to next years version

$packageArgsPS  = @{
  packageName    = 'AutoCAD LT 2022 - English Product Specific Pack'
  fileType       = 'msi'
  silentArgs     = "{28B89EEF-5109-0409-2102-CF3F3A09B77D} /qn /norestart"
}
Uninstall-ChocolateyPackage @packageArgsPS

$packageArgsACAD  = @{
  packageName    = 'AutoCAD LT 2022 - English'
  fileType       = 'msi'
  silentArgs     = "{28B89EEF-5109-0000-0102-CF3F3A09B77D} /qn /norestart"
}
Uninstall-ChocolateyPackage @packageArgsACAD

$packageArgsLP = @{
  packageName    = 'AutoCAD LT 2022 Language Pack - English'
  fileType       = 'msi'
  silentArgs     = "{28B89EEF-5109-0409-1102-CF3F3A09B77D} /qn /norestart"
}
Uninstall-ChocolateyPackage @packageArgsLP

$packageArgsILB  = @{
  packageName    = 'Autodesk Material Library Base Resolution Image Library 2022'
  fileType       = 'msi'
  silentArgs     = "{6256584F-B04B-41D4-8A59-44E70940C473} /qn /norestart"
}
Uninstall-ChocolateyPackage @packageArgsILB

$packageArgsCM   = @{
  packageName    = 'Autodesk Material Library 2022'
  fileType       = 'msi'
  silentArgs     = "{A9221A68-5AD0-4215-B54F-CB5DBA4FB27C} /qn /norestart"
}
Uninstall-ChocolateyPackage @packageArgsCM
