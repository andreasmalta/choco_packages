$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "{139C013B-5BAC-4101-BC6C-B2A78C0125A4} /qn /norestart"
}
Uninstall-ChocolateyPackage @packageArgs
