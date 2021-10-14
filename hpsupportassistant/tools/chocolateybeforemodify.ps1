$ErrorActionPreference = 'Stop';

$folderlong = 'C:\Program Files (x86)\Hewlett-Packard\HP Support Framework\UninstallHPSA.exe'
if (Test-path $folderlong) { 
Uninstall-ChocolateyPackage -PackageName $env:ChocolateyPackageName -FileType 'exe' -SilentArgs '/s /v /qn' -File "$folderlong"
}

$foldershort = 'C:\Program Files (x86)\HP\HP Support Framework\UninstallHPSA.exe'
if (Test-path $foldershort) { 
Uninstall-ChocolateyPackage -PackageName $env:ChocolateyPackageName -FileType 'exe' -SilentArgs '/s /v /qn' -File "$foldershort"
}
