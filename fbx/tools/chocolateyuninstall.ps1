$ErrorActionPreference = 'Stop';

$uninstall = "C:\Program Files\Blueberry Software\FBX Game Recorder\uninstall.exe"
if (Test-path $uninstall) { Uninstall-ChocolateyPackage -PackageName "FBX Game Recorder" -FileType "exe" -SilentArgs "/S" -File $uninstall }
