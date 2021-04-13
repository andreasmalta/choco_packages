$ErrorActionPreference = 'Stop';

#Uninstall 2022 & Language Pack before upgrade
Uninstall-ChocolateyPackage -PackageName "Inventor View" -FileType "msi" -SilentArgs "{7F4DD591-2664-0004-0000-7107D70F3DB4} /qn /norestart"
Uninstall-ChocolateyPackage -PackageName "Inventor View Language Pack" -FileType "msi" -SilentArgs "{7F4DD591-2664-0004-1033-7107D70F3DB4} /qn /norestart"
