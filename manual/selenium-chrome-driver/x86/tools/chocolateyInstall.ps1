$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$seleniumDir = "$(Get-ToolsLocation)\selenium"
$driverPath = "$seleniumDir\chromedriver.exe"

$parameters = Get-PackageParameters

$packageArgs = @{
  packageName   = 'selenium-chrome-driver'
  url           = 'https://chromedriver.storage.googleapis.com/81.0.4044.138/chromedriver_win32.zip'
  checksum      = '815fdfe8d914be57a039396ff08b9af83a4f8a30b2d1d8f48c69137f21a4df5d083c6496574a1013345484614b70583742069d78c0af66c41a692d2225ee2916'
  checksumType  = 'sha512'
  unzipLocation = $seleniumDir
}
Install-ChocolateyZipPackage @packageArgs

Uninstall-BinFile -Name 'chromedriver'
If ($parameters['SkipShim'] -ne 'true') {
  Install-BinFile -Name 'chromedriver' -Path $driverPath
}

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "$menuPrograms\Selenium\Selenium Chrome Driver.lnk"
  targetPath       = $driverPath
  iconLocation     = "$toolsDir\icon.ico"
}
Install-ChocolateyShortcut @shortcutArgs
