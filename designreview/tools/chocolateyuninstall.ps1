$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  silentArgs    = '-i uninstall --trigger_point system -m C:\ProgramData\Autodesk\ODIS\metadata\{96FBAF50-A8E7-38E4-82D5-B146E5EA8935}\bundleManifest.xml -x C:\ProgramData\Autodesk\ODIS\metadata\{96FBAF50-A8E7-38E4-82D5-B146E5EA8935}\SetupRes\manifest.xsd -q'
  file			= 'C:\Program Files\Autodesk\AdODIS\V1\Installer.exe'
}
Uninstall-ChocolateyPackage @packageArgs
