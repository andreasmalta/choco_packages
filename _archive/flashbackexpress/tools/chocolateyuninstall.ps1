$uninstall64 = "C:\Program Files (x86)\Blueberry Software\FlashBack Express 5\uninstall.exe"
if (Test-path $uninstall64) { Uninstall-ChocolateyPackage -PackageName "FlashBack Express 5" -FileType "exe" -SilentArgs "/S" -File $uninstall64 }

$uninstall32 = "C:\Program Files\Blueberry Software\FlashBack Express 5\uninstall.exe"
if (Test-path $uninstall32) { Uninstall-ChocolateyPackage -PackageName "FlashBack Express 5" -FileType "exe" -SilentArgs "/S" -File $uninstall32 }
