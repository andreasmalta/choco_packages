$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "{28B89EEF-2028-0409-0100-CF3F3A09B77D} /qn /norestart"
}
Uninstall-ChocolateyPackage @packageArgs
