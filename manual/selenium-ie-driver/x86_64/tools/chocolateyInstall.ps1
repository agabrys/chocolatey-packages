$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\IEDriverServer.exe"

$parameters = Get-PackageParameters

$packageArgs = @{
  packageName    = 'selenium-ie-driver'
  url            = 'https://selenium-release.storage.googleapis.com/3.150/IEDriverServer_Win32_3.150.1.zip'
  checksum       = 'd2bea624cae1c03fc8a250ace2233d6d8f246dcb563a5730b40205182203bae24b4401aa553a4da6b6ef5368a9ea5863ccc98d7bbcaedcf3bcf7906a5aa2581d'
  checksumType   = 'sha512'
  url64bit       = 'https://selenium-release.storage.googleapis.com/3.150/IEDriverServer_x64_3.150.1.zip'
  checksum64     = '3dafd8d72ff3d4b5bf521cad4a298b60f099c5c8d45b751c527ecd291509f65364e420eba3be517484853e5a7678438390b0d793b8c5f1a6af2cfbc688fb1338'
  checksumType64 = 'sha512'
  unzipLocation  = $seleniumDir
}
Install-ChocolateyZipPackage @packageArgs

Uninstall-BinFile -Name 'IEDriverServer'
If ($parameters['SkipShim'] -ne 'true') {
  Install-BinFile -Name 'IEDriverServer' -Path $driverPath
}

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "$menuPrograms\Selenium\Selenium Internet Explorer Driver.lnk"
  targetPath       = $driverPath
  iconLocation     = "$toolsDir\icon.ico"
}
Install-ChocolateyShortcut @shortcutArgs
