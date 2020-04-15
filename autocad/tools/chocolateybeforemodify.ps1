$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'AutoCAD_*'

$AutoCAD2021English = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "{28B89EEF-4101-0409-2102-CF3F3A09B77D} /qn /norestart"
}

$AutoCAD2021 = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "{28B89EEF-4101-0000-0102-CF3F3A09B77D} /qn /norestart"
}

$AutoCAD2021LanguagePackEnglish = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "{28B89EEF-4101-0409-1102-CF3F3A09B77D} /qn /norestart"
}

$ACAMEP2021ObjectEnabler = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "{28B89EEF-4104-0000-5102-CF3F3A09B77D} /qn /norestart"
}

$ACADPrivate = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "{28B89EEF-4101-0000-3102-CF3F3A09B77D} /qn /norestart"
}

$AutodeskAppManager20202021 = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "{DB92FEA7-F78C-469E-B138-E2303220F0C4} /qn /norestart"
}

$AutodeskFeaturedApps20202021 = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "{2CBD494D-0A3E-4CB3-AFB3-8CE1734613B0} /qn /norestart"
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

$AutodeskSavetoWebandMobile = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "{A9005AC0-4AD8-4E84-B1F7-EE38BB6BCC2D} /qn /norestart"
}

$AutodeskSingleSignOnComponent = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "{951BB060-1350-4C93-BD83-D966C51D4005} /qn /norestart"
}

Stop-Process -Name "Autodesk*" -Force
Stop-Service -Name "AdAppMgrSvc"
Uninstall-ChocolateyPackage @AutoCAD2021English
Uninstall-ChocolateyPackage @AutoCAD2021
Uninstall-ChocolateyPackage @AutoCAD2021LanguagePackEnglish
Uninstall-ChocolateyPackage @ACAMEP2021ObjectEnabler
Uninstall-ChocolateyPackage @ACADPrivate
Uninstall-ChocolateyPackage @AutodeskAppManager20202021
Uninstall-ChocolateyPackage @AutodeskFeaturedApps20202021
Uninstall-ChocolateyPackage @AutodeskMaterialLibrary2021
Uninstall-ChocolateyPackage @AutodeskMaterialLibraryBaseResolutionImageLibrary2021
Uninstall-ChocolateyPackage @AutodeskSavetoWebandMobile
Uninstall-ChocolateyPackage @AutodeskSingleSignOnComponent
Remove-Item –path C:\ProgramData\Autodesk\SDS –recurse
& "C:\Program Files (x86)\Autodesk\Autodesk Desktop App\removeAdAppMgr.exe" --mode unattended
Remove-Item $fileLocation -Recurse -Force -ErrorAction Ignore
