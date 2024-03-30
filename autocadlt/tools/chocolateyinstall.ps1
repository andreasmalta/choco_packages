$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#UNINSTALL OLD VERSIONS
. $toolsDir\helpers.ps1
Invoke-UninstallOld


https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage412979011845822.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACDLT_2025_Czech_WIN64.exe%22&
A28489C93F4EED3F1B04B75519BAA9B18F78F4126D8F9A6CE03E5E97606ED545

https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage415207093511714.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACDLT_2025_English_WIN64.exe%22&
45A88C9E11D227A278DF871A354F667FA8FFBB02B8422B64A901762A6DEB6975

https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage415267695417532.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACDLT_2025_French_WIN64.exe%22&
0F4BCD8B55D77493E87AF3ABA77E424A8DB6A5FDAD98DBBF91D2015D78D16446

https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage415236449468016.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACDLT_2025_German_WIN64.exe%22&
64673B143173145B5C8390947A795D15B0B285C67B724D6369428BAFEAF668D7

https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage415549223910672.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACDLT_2025_Hungarian_WIN64.exe%22&
A7E95425DD0475BA57894EDAF527CDBCD70D638833E468D330CE353A09486BEF

https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage415784277134000.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACDLT_2025_Italian_WIN64.exe%22&
ECBD1B15132D6AC8514E56B939DACBA848346468109D4495C1BBC01B2B316607

https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage415627557409269.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACDLT_2025_Japanese_WIN64.exe%22&
69880332EB70FC2410D0F8397EACEE653AC4A8F3D50F603C910571F40E521A53

https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage415669233982200.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACDLT_2025_Korean_WIN64.exe%22&
34806095D784647CBF50D4A70F275D7544DE4DEE8E7460FEA3E0669AD80BFD8A

https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage415918911731613.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACDLT_2025_Polish_WIN64.exe%22&
F490F360146AC18E54627703117813D43C82E0233AB6AD75868BC3D18DD1EFE1

https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage415736928653045.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACDLT_2025_Portuguese_WIN64.exe%22&
A8AF9F90CBF024F75C50B627AEF6D75DB67B750520D953010E930856D1EF3D5B

https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage415759362201302.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACDLT_2025_Russian_WIN64.exe%22&
DFC7050C5690C4DA0F1884252ED0F32A0314E7BD1F715986957A32F546769FF0

https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage415989595934009.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACDLT_2025_Simplified_Chinese_WIN64.exe%22&
414D4189FE7C38D183E7C93C2D59B06FC2A2ED51259E228E76FEA11CDC950349

https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage415809385681467.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACDLT_2025_Spanish_WIN64.exe%22&
EDF5E03629FAD0F8B476F10C36D69417B4442F581082EEA42A938532208FB338

https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage415838252210817.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACDLT_2025_Traditional_Chinese_WIN64.exe%22&
C0C58D900832BE0180A64F459C8371F76A1FA61BD6E7B105F90A0A90A5380BE9


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
