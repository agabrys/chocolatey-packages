$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\geckodriver.exe"

$parameters = Get-PackageParameters

$packageArgs = @{
  packageName    = 'selenium-gecko-driver'
  url            = 'https://github.com/mozilla/geckodriver/releases/download/v0.21.0/geckodriver-v0.21.0-win32.zip'
  checksum       = 'a85ca7785d2085e9be3e9a56e8c7d046448eb875abe77b96294a7e342cc77218136a5461de936ef2d025ae46ac967b4305fb720314c190f9e617455d7238e2ee'
  checksumType   = 'sha512'
  url64bit       = 'https://github.com/mozilla/geckodriver/releases/download/v0.21.0/geckodriver-v0.21.0-win64.zip'
  checksum64     = 'edde3784a4d6d35c5e9072050f6a84c7e2de1b6724112a8e687da214c3c0fed64cce36d598bab0ff17974d451f96ef41044da28c853d27a38c1b7bceb0235a55'
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
