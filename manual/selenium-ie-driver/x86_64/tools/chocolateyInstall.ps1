$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\IEDriverServer.exe"

$packageArgs = @{
  packageName    = 'selenium-ie-driver'
  url            = 'https://selenium-release.storage.googleapis.com/3.8/IEDriverServer_Win32_3.8.0.zip'
  checksum       = 'cb04f2ce5956666847d39d5be86a4e0fa8b36d44a7b5cd50cfb18ba086c5946039dcab7153a5378511612e7a8e56721658e5c6b57605303ca4d4cd1a3643346a'
  checksumType   = 'sha512'
  url64bit       = 'https://selenium-release.storage.googleapis.com/3.8/IEDriverServer_x64_3.8.0.zip'
  checksum64     = '0f5aaa335912a35fe32e3960019e5565554bd276bb65d18bb3b9ecd9cff1d39970f279c2b619ca6ae6f1484adf181a7f59fa1071e98e390af8778712beae66cf'
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
