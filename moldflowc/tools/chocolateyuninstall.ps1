$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#UNINSTALL
. $toolsDir\helpers.ps1
Invoke-UninstallOldMFC

$uninstaller = 'C:\Program Files (x86)\Autodesk\Autodesk Desktop App\removeAdAppMgr.exe'
if (Test-Path $uninstaller) {
		Stop-Process -Name "Autodesk*" -Force
		Stop-Service -Name "AdAppMgrSvc"
		Remove-Item -Path 'C:\ProgramData\Autodesk\SDS' -recurse
		Uninstall-ChocolateyPackage -PackageName 'Autodesk Desktop App' -FileType 'exe' -SilentArgs '--mode unattended' -File $uninstaller
	}
