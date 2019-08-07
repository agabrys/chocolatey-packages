$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\IEDriverServer.exe"

$parameters = Get-PackageParameters

$packageArgs = @{
  packageName    = 'selenium-ie-driver'
  url            = 'https://selenium-release.storage.googleapis.com/3.141/IEDriverServer_Win32_3.141.0.zip'
  checksum       = 'a5ebfa3b0d23d0d820930ddb90a20761b5c4a418a1414a2722972ab245469dc49a7a4d5faca3b0fe9dadf12392ac4195a624f081d07204d4345cf003c7dea6e7'
  checksumType   = 'sha512'
  url64bit       = 'https://selenium-release.storage.googleapis.com/3.141/IEDriverServer_x64_3.141.0.zip'
  checksum64     = 'c838598fb3dc711525bbb86e8ffca7fcadff175a6b4d6c9d561e304b2fddfedd7ce99c80fc80e7f33b991bc89e1ecc85275f153c565945ae474cd676aae8cd92'
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
