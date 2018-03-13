$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\geckodriver.exe"

$packageArgs = @{
  packageName    = 'selenium-gecko-driver'
  url            = 'https://github.com/mozilla/geckodriver/releases/download/v0.20.0/geckodriver-v0.20.0-win32.zip'
  checksum       = '737a72861a55387d80248996d6f204caa4284d97ae10c48ab96db27b81aff9c624de8b6f5b4034483779cf773d8634135889379cfc0b16593c9fc31126c95b89'
  checksumType   = 'sha512'
  url64bit       = 'https://github.com/mozilla/geckodriver/releases/download/v0.20.0/geckodriver-v0.20.0-win64.zip'
  checksum64     = 'dd1b0be36e199c0473a19f4e86df385b9f88a55e32cbf4595d6aabc66b3ce423f3a19c7f44c118f6d3be5c8bf0a4c440ab33b78b65f5db71bbe5cf29a5135bdd'
  checksumType64 = 'sha512'
  unzipLocation  = $seleniumDir
}
Install-ChocolateyZipPackage @packageArgs

Install-BinFile -Name 'geckodriver' -Path $driverPath

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "$menuPrograms\Selenium\Selenium Gecko Driver.lnk"
  targetPath       = $driverPath
  iconLocation     = "$toolsDir\icon.ico"
}
Install-ChocolateyShortcut @shortcutArgs
