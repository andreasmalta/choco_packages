$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  silentArgs    = "/S"
  file			= 'C:\Program Files (x86)\Blueberry Software\FlashBack Express 5\uninstall.exe'
}
Uninstall-ChocolateyPackage @packageArgs
