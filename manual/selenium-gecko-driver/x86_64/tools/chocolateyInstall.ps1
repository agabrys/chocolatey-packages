$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\geckodriver.exe"

$parameters = Get-PackageParameters

$packageArgs = @{
  packageName    = 'selenium-gecko-driver'
  url            = 'https://github.com/mozilla/geckodriver/releases/download/v0.25.0/geckodriver-v0.25.0-win32.zip'
  checksum       = '151297af888e4c36e51457170f5f126f93c61761e5dd57d134ad1414147c175cca56a8fb6bb85a131f39f85cef92896b611d3127c26965a20d7d6833e4f4979f'
  checksumType   = 'sha512'
  url64bit       = 'https://github.com/mozilla/geckodriver/releases/download/v0.25.0/geckodriver-v0.25.0-win64.zip'
  checksum64     = '991079d8950a302c2ae6fac5336a28268bb81a4bd33eea86a682b567dee24a35201dd3b41a613c001fbf0c7920c0e9d11eda56a65f58c81f26139c7ada7bf436'
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
