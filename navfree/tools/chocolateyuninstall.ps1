$ErrorActionPreference = 'Stop';

#uninstalling autodesk desktop app requires some prep
Stop-Process -Name "Autodesk*" -Force
Stop-Service -Name "AdAppMgrSvc"
Remove-Item –path C:\ProgramData\Autodesk\SDS –recurse
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  silentArgs    = '--mode unattended'
  file			= 'C:\Program Files (x86)\Autodesk\Autodesk Desktop App\removeAdAppMgr.exe'
}
Uninstall-ChocolateyPackage @packageArgs
