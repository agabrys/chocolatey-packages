$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\IEDriverServer.exe"

$packageArgs = @{
  packageName    = 'selenium-ie-driver'
  url            = 'https://selenium-release.storage.googleapis.com/3.12/IEDriverServer_Win32_3.12.0.zip'
  checksum       = '1b422a41a935769a7bea9ea8897157d8b214d7dc7e43a20dec443beacc55a3ca0b1178fab1b80435d4b09957e92151e3c046155301f7dacbecd91ae33934f7d7'
  checksumType   = 'sha512'
  url64bit       = 'https://selenium-release.storage.googleapis.com/3.12/IEDriverServer_x64_3.12.0.zip'
  checksum64     = 'f117a1eb8aaa00babc2caea35c776dea6733100bc764bfaa3e930a44fde0185bd943957ec16e73ec4e9deb4194b78c0787f91a2cb6be75f6ad815711cd13287d'
  checksumType64 = 'sha512'
  unzipLocation  = $seleniumDir
}
Install-ChocolateyZipPackage @packageArgs

Install-BinFile -Name 'IEDriverServer' -Path $driverPath

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "$menuPrograms\Selenium\Selenium Internet Explorer Driver.lnk"
  targetPath       = $driverPath
  iconLocation     = "$toolsDir\icon.ico"
}
Install-ChocolateyShortcut @shortcutArgs
