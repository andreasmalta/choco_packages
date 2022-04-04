$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsDir\cleanup.ps1"

#Uninstall Autodesk Desktop App
Stop-Process -Name "Autodesk*" -Force
Stop-Service -Name "AdAppMgrSvc"
Remove-Item –path C:\ProgramData\Autodesk\SDS –recurse
Uninstall-ChocolateyPackage -PackageName 'Autodesk Desktop App' -FileType 'exe' -SilentArgs '--mode unattended' -File 'C:\Program Files (x86)\Autodesk\Autodesk Desktop App\removeAdAppMgr.exe'
