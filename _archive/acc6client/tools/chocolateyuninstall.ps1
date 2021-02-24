$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  silentArgs    = "/s MODIFY=FALSE REMOVE=TRUE UNINSTALL=YES"
  file			= 'C:\ProgramData\{FAC0E652-8EDB-4C70-8AF9-1F7DD75AAC56}\AvigilonControlCenterClient.exe'
}
Uninstall-ChocolateyPackage @packageArgs
