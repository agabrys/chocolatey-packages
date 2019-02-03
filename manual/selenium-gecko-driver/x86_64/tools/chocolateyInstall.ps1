$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\geckodriver.exe"

$parameters = Get-PackageParameters

$packageArgs = @{
  packageName    = 'selenium-gecko-driver'
  url            = 'https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-win32.zip'
  checksum       = 'bdc1ac6d2d439422f5a88fb8b92d74133d1371edd2d8792b0d0ba86b995e85494b96f192c163aeb13d6cb9e3bee5cc4ed576b7435c7a65b77c3029ababc50f53'
  checksumType   = 'sha512'
  url64bit       = 'https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-win64.zip'
  checksum64     = 'd1eb5263b70e65fd1dbb1255beb1c877a43facba310aaa451a59bb54c0025101235e0c00d024f58b79645302676ab8c01387e2d884dbf856a904ffa53688f481'
  checksumType64 = 'sha512'
  unzipLocation  = $seleniumDir
}
Install-ChocolateyZipPackage @packageArgs

Uninstall-BinFile -Name 'geckodriver'
If ($parameters['SkipShim'] -ne 'true') {
  Install-BinFile -Name 'geckodriver' -Path $driverPath
}

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "$menuPrograms\Selenium\Selenium Gecko Driver.lnk"
  targetPath       = $driverPath
  iconLocation     = "$toolsDir\icon.ico"
}
Install-ChocolateyShortcut @shortcutArgs
