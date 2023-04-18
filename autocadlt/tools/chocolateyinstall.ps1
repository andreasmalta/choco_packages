$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#UNINSTALL OLD VERSIONS
. $toolsDir\helpers.ps1
Invoke-UninstallOld

#LANGUAGES AND INSTALL
$pp = Get-PackageParameters
if ($pp.'ChineseSimp') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACDLT/73E6C25F-EEFD-3C10-8F94-27C090847201/SFX/AutoCAD_LT_2024_Simplified_Chinese_Win_64bit_dlm.sfx.exe'
$checksum = '7C578660A0420DDA6CF028BAE8A90FBB5CE4C151BB3E1E17D581E82F48A42569'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2024_Simplified_Chinese_Win_64bit_dlm\Setup.exe'
}

elseif ($pp.'ChineseTrad') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACDLT/93270C7F-2C2F-3203-899D-A311B40967EE/SFX/AutoCAD_LT_2024_Traditional_Chinese_Win_64bit_dlm.sfx.exe'
$checksum = 'EB1A19D2C8A4C90BFE1BC320F4065CE549AB186AB85EFEDD2BD21931DCF161B5'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2024_Traditional_Chinese_Win_64bit_dlm\Setup.exe'
}

elseif ($pp.'Czech') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACDLT/BD58AD42-66DF-3ACE-88F4-156FE0693F8F/SFX/AutoCAD_LT_2024_Czech_Win_64bit_dlm.sfx.exe'
$checksum = '2E9EFC6DD489D533DEE5BA0B3BE0FCF68AD6770E1EC99BFAC4914F9520F1C622'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2024_Czech_Win_64bit_dlm\Setup.exe'
}

elseif ($pp.'French') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACDLT/17D6E577-5802-3C73-9065-FC98E90A1746/SFX/AutoCAD_LT_2024_French_Win_64bit_dlm.sfx.exe'
$checksum = '0A160FBFB2D34CE69064F83CF085DEBA8695DDC2B6CF15B921B6ED9543FC96EE'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2024_French_Win_64bit_dlm\Setup.exe'
}

elseif ($pp.'German') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACDLT/38A154B1-6A8F-3923-A2FD-B8621BE6BDB6/SFX/AutoCAD_LT_2024_German_Win_64bit_dlm.sfx.exe'
$checksum = 'F0D5EAA1718B47CBCC52EEF363624C0680CA719767260C1FD9BD6D2FD96EE020'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2024_German_Win_64bit_dlm\Setup.exe'
}

elseif ($pp.'Hungarian') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACDLT/04EFE2E7-D3D3-3F6B-A44E-3EECA4727AA1/SFX/AutoCAD_LT_2024_Hungarian_Win_64bit_dlm.sfx.exe'
$checksum = 'ECC6E4CABBC3088A1C88E1E998BEB1D718EC857AD13450EA65DFB3675AC369B5'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2024_Hungarian_Win_64bit_dlm\Setup.exe'
}

elseif ($pp.'Italian') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACDLT/52DE4325-0A66-3AD7-89B0-23CF5CD38D3F/SFX/AutoCAD_LT_2024_Italian_Win_64bit_dlm.sfx.exe'
$checksum = 'ABBAAF7379CCB738FC5BE1051DAD6D04B8C838A75971806EB2B8776EF1F7C4E0'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2024_Italian_Win_64bit_dlm\Setup.exe'
}

elseif ($pp.'Japanese') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACDLT/13A463DB-D686-3281-8DB9-F3FB8B8C08F2/SFX/AutoCAD_LT_2024_Japanese_Win_64bit_dlm.sfx.exe'
$checksum = '1E32B3D1CB64775CAFFBC1A07830B75A85357A37F51BE978B311A0B48DDE2FC1'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2024_Japanese_Win_64bit_dlm\Setup.exe'
}

elseif ($pp.'Korean') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACDLT/D8C5DB52-2418-347E-9490-744ABA6EEE43/SFX/AutoCAD_LT_2024_Korean_Win_64bit_dlm.sfx.exe'
$checksum = '603DDFAE26F67BFB4DA9579A9ACF2DE0BED5A4DB12B78E56867966D519E69148'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2024_Korean_Win_64bit_dlm\Setup.exe'
}

elseif ($pp.'Polish') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACDLT/B7DCBDDB-3C18-33CC-9C8E-DA323FA84666/SFX/AutoCAD_LT_2024_Polish_Win_64bit_dlm.sfx.exe'
$checksum = '8611FE3CF0C9C28BD0AA565E2AD7BEB94E88E008D2C8EE413F8D9A2F7BF9DAA3'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2024_Polish_Win_64bit_dlm\Setup.exe'
}

elseif ($pp.'Portuguese') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACDLT/C23B2CDF-55CD-32BF-9031-47CA165196BC/SFX/AutoCAD_LT_2024_Brazilian_Portuguese_Win_64bit_dlm.sfx.exe'
$checksum = 'F936B9A483677F638904CE5881A52C08899D47C9EA112E272CFDC08742110DC6'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2024_Brazilian_Portuguese_Win_64bit_dlm\Setup.exe'
}

elseif ($pp.'Russian') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACDLT/965D6DA7-F826-3617-BED5-1B01BCC2E6A7/SFX/AutoCAD_LT_2024_Russian_Win_64bit_dlm.sfx.exe'
$checksum = 'BBEA05C36D12EEC210254FE50AD88016EBE081629D59395DEA3572B70083B598'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2024_Russian_Win_64bit_dlm\Setup.exe'
}

elseif ($pp.'Spanish') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACDLT/C9419831-0AFE-3E20-A75E-F4AABC25A082/SFX/AutoCAD_LT_2024_Spanish_Win_64bit_dlm.sfx.exe'
$checksum = '2303A4E62AA86D2EAB52CD68A8D674F89FA40EF6C618C8822069FC3542ABC1A4'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2024_Spanish_Win_64bit_dlm\Setup.exe'
}

else {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACDLT/4558A64D-DFA2-3773-BF42-92414FF3F3DF/SFX/AutoCAD_LT_2024_English_Win_64bit_dlm.sfx.exe'
$checksum = '61767B082E20756E35C56B0798BFE5CFDF18AC884DF900A318460AAF99BDAB75'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2024_English_Win_64bit_dlm\Setup.exe'
}

$packageArgsUnzip = @{
  packageName    = 'AutoCAD LT Installation Files'
  fileType       = 'exe'
  url            = $url
  softwareName   = 'AutoCAD LT Installation Files*'
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = "-suppresslaunch -d $env:TEMP"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgsUnzip

$packageArgs  = @{
  packageName    = 'AutoCAD LT'
  fileType       = 'exe'
  file           = $file
  softwareName   = 'AutoCAD LT*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
