$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  silentArgs    = "/S"
  file			= 'C:\Program Files\Kinovea\Uninstall-Kinovea.exe'
}
Uninstall-ChocolateyPackage @packageArgs
