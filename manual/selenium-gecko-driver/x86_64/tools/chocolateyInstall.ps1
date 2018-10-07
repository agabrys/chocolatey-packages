$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\geckodriver.exe"

$parameters = Get-PackageParameters

$packageArgs = @{
  packageName    = 'selenium-gecko-driver'
  url            = 'https://github.com/mozilla/geckodriver/releases/download/v0.23.0/geckodriver-v0.23.0-win32.zip'
  checksum       = 'e4a3f2846b1c0eee085a8d28788a2ead8fb3b2e089b358956fe3193ab6796534f23fe13c54e8b8f7dcb337903206810e734509bfe2f5f15cbb13a04f4572affc'
  checksumType   = 'sha512'
  url64bit       = 'https://github.com/mozilla/geckodriver/releases/download/v0.23.0/geckodriver-v0.23.0-win64.zip'
  checksum64     = '2299ecc5b3eeedc705dfbd5860a41781bb60df45d0ef2ea0e3cf20bd7d4ad4f5f6e255dd6524e4f42b77ccf2d7618c44ee7ce6e64b8852a17f78016e40fb4edf'
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
