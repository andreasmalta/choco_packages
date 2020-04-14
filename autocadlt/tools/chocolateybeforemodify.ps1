$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'AutoCAD_LT_*'

$AutoCADLT2021English = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "{28B89EEF-4109-0409-2102-CF3F3A09B77D} /qn /norestart"
}

$AutodeskSingleSignOnComponent = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "{951BB060-1350-4C93-BD83-D966C51D4005} /qn /norestart"
}

$AutodeskSavetoWebandMobile = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "{A9005AC0-4AD8-4E84-B1F7-EE38BB6BCC2D} /qn /norestart"
}

$AutodeskMaterialLibrary2021 = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "{6774FD60-7D4B-4D57-BE56-2702A07C9701} /qn /norestart"
}

$AutodeskMaterialLibraryBaseResolutionImageLibrary2021 = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "{6EFAD582-86C1-4AB2-97C5-2070D0B90E08} /qn /norestart"
}

Stop-Process -Name "Autodesk*" -Force
Stop-Service -Name "AdAppMgrSvc"
Uninstall-ChocolateyPackage @AutoCADLT2021English
Uninstall-ChocolateyPackage @AutodeskSingleSignOnComponent
Uninstall-ChocolateyPackage @AutodeskSavetoWebandMobile
Uninstall-ChocolateyPackage @AutodeskMaterialLibrary2021
Uninstall-ChocolateyPackage @AutodeskMaterialLibraryBaseResolutionImageLibrary2021
Remove-Item –path C:\ProgramData\Autodesk\SDS –recurse
& "C:\Program Files (x86)\Autodesk\Autodesk Desktop App\removeAdAppMgr.exe" --mode unattended
Remove-Item $fileLocation -Recurse -Force -ErrorAction Ignore
