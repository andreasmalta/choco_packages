$ErrorActionPreference = 'Stop';

$url            = 'https://up.autodesk.com/2017/CDX/AB4AADCC-F890-4B4F-A7A6-B0FBD2386796/DesktopConnector-x64.exe'
$checksum_url   = '27B0BBD26B061645A9360B7AF514D51A9060D42A79484CEF8D75980A3CD0194D'
$packageArgsURL = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'autodesk desktop connector*'
  checksum      = $checksum_url
  checksumType  = 'sha256'
  silentArgs    = "-s"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgsURL
