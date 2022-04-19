$ErrorActionPreference = 'Stop';

Stop-Process -Name "Autodesk*" -Force
Stop-Service -Name "AdAppMgrSvc"
Remove-Item –path C:\ProgramData\Autodesk\SDS –recurse
Uninstall-ChocolateyPackage -PackageName 'Autodesk Desktop App' -FileType 'exe' -SilentArgs '--mode unattended' -File 'C:\Program Files (x86)\Autodesk\Autodesk Desktop App\removeAdAppMgr.exe'
