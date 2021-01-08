$ErrorActionPreference = 'Stop';

#Uninstall old version - Autodesk Moldflow Communicator 2021
Uninstall-ChocolateyPackage -PackageName "Autodesk Moldflow Communicator 2021" -FileType "msi" -SilentArgs "{753C779D-0564-4042-8000-8FF1C120CB5E} /qn /norestart"
