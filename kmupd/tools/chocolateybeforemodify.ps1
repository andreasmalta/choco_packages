$ErrorActionPreference = 'Stop';
$validExitCodes = @(0, 3010, 1605, 1614, 1641)
Uninstall-ChocolateyPackage -PackageName "Universal PCL6 x64 Multi-Lingual driver" -FileType "msi" -SilentArgs "{710D3701-E7E6-4958-A75B-60663234694D} /qn /norestart" -ValidExitCodes $validExitCodes
Uninstall-ChocolateyPackage -PackageName "Universal PS x64 Multi-Lingual driver" -FileType "msi" -SilentArgs "{8F32D344-DE7B-4D48-ADD0-1811AE858FFE} /qn /norestart" -ValidExitCodes $validExitCodes
Uninstall-ChocolateyPackage -PackageName "Universal PCL5 x64 Multi-Lingual driver" -FileType "msi" -SilentArgs "{A8C9B8BA-88CA-4322-B686-9AD7330BCF06} /qn /norestart" -ValidExitCodes $validExitCodes
