$ErrorActionPreference = 'Stop';

$packagename     = 'Inventor View 2022'
$productcode     = '{7F4DD591-2664-0004-0000-7107D70F3DB4}'
$regkey          = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$productcode"
if (Test-path $regkey) { Uninstall-ChocolateyPackage -PackageName "$packagename" -FileType "msi" -SilentArgs "$productcode /qn /norestart" }

$packagename     = 'Language Pack 2022'
$productcode     = '{7F4DD591-2664-0004-1033-7107D70F3DB4}'
$regkey          = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$productcode"
if (Test-path $regkey) { Uninstall-ChocolateyPackage -PackageName "$packagename" -FileType "msi" -SilentArgs "$productcode /qn /norestart" }
