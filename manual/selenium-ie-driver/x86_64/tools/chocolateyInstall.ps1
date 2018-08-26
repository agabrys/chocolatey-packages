$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\IEDriverServer.exe"

$parameters = Get-PackageParameters

$packageArgs = @{
  packageName    = 'selenium-ie-driver'
  url            = 'https://selenium-release.storage.googleapis.com/3.14/IEDriverServer_Win32_3.14.0.zip'
  checksum       = 'dae4e65f8a3fecf4802481e08231901393779507621315bac8c04ce0930697708c2a082556ba708b418bcac6cd925e6c8cd2c84f4b3ab1ced285ab75a988bc64'
  checksumType   = 'sha512'
  url64bit       = 'https://selenium-release.storage.googleapis.com/3.14/IEDriverServer_x64_3.14.0.zip'
  checksum64     = 'e9b0d85614ac36bb66f3e20e37457ff4dd06801adcc50c2a5d2c7fea5b579a541c02f2db1d8fddecf790afed4d0c556938fb37081ed789c69f031b6e15b23052'
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
