$fileLocation = Join-Path $env:ChocolateyInstall 'lib\dwgtrueview.install\tools\DWGTrueView_2019_Enu_32bit\'
$fileLocation64 = Join-Path $env:ChocolateyInstall 'lib\dwgtrueview.install\tools\DWGTrueView_2019_Enu_64bit\'
Remove-Item –path $fileLocation
Remove-Item –path $fileLocation64
