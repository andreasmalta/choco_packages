#Uninstall 2021.1
$packagename     = 'Autodesk Moldflow Communicator 2021.1'
$productcode     = '{753C779D-0564-4042-8000-8FF1C120CB5E}'
$regkey          = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$productcode"
if (Test-path $regkey) { Uninstall-ChocolateyPackage -PackageName "$packagename" -FileType "msi" -SilentArgs "$productcode /qn /norestart" }

#Uninstall 2021.2
$packagename     = 'Autodesk Moldflow Communicator 2021.2'
$productcode     = '{753C779D-0564-4044-8000-8FF1C120CB5E}'
$regkey          = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$productcode"
if (Test-path $regkey) { Uninstall-ChocolateyPackage -PackageName "$packagename" -FileType "msi" -SilentArgs "$productcode /qn /norestart" }

#Uninstall Autodesk Desktop App
Stop-Process -Name "Autodesk*" -Force
Stop-Service -Name "AdAppMgrSvc"
Remove-Item –path C:\ProgramData\Autodesk\SDS –recurse
& "C:\Program Files (x86)\Autodesk\Autodesk Desktop App\removeAdAppMgr.exe" --mode unattended
