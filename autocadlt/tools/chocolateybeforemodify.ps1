$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'AutoCAD_LT_*'

$AutoCADLT2021English = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "{28B89EEF-4109-0409-2102-CF3F3A09B77D} /qn /norestart"
}

$AutoCADLT2021 = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "{28B89EEF-4109-0000-0102-CF3F3A09B77D} /qn /norestart"
}

$AutoCADLT2021LanguagePackEnglish = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "{28B89EEF-4109-0409-1102-CF3F3A09B77D} /qn /norestart"
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

Uninstall-ChocolateyPackage @AutoCADLT2021English
Uninstall-ChocolateyPackage @AutoCADLT2021
Uninstall-ChocolateyPackage @AutoCADLT2021LanguagePackEnglish
Uninstall-ChocolateyPackage @AutodeskMaterialLibrary2021
Uninstall-ChocolateyPackage @AutodeskMaterialLibraryBaseResolutionImageLibrary2021
Remove-Item $fileLocation -Recurse -Force -ErrorAction Ignore
