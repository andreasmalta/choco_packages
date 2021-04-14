$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  silentArgs    = "/S"
  file			= 'C:\Program Files\Kinovea\Uninstall.exe'
}
Uninstall-ChocolateyPackage @packageArgs
