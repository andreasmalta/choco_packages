$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  silentArgs    = "/s MODIFY=FALSE REMOVE=TRUE UNINSTALL=YES"
  file			= 'C:\ProgramData\{B9D2D163-5738-4D49-AC81-EC3B5A3AB01B}\AvigilonControlCenterClient.exe'
}
Uninstall-ChocolateyPackage @packageArgs
