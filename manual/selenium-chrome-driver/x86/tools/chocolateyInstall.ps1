$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$seleniumDir = "$(Get-ToolsLocation)\selenium"
$driverPath = "$seleniumDir\chromedriver.exe"

$parameters = Get-PackageParameters

$packageArgs = @{
  packageName   = 'selenium-chrome-driver'
  url           = 'https://chromedriver.storage.googleapis.com/84.0.4147.30/chromedriver_win32.zip'
  checksum      = '7c46008eb17f3e1a96a4e1f5e32485f80d14f7418a1e94e1dc2c19b1ec4a4bd9cb6cb0894210e41d898b66d24c47a2b4da2352af3a33ec20125cd071aa4f7a27'
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
