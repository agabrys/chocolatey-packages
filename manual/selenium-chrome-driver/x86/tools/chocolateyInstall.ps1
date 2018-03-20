$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\chromedriver.exe"

$packageArgs = @{
  packageName   = 'selenium-chrome-driver'
  url           = 'https://chromedriver.storage.googleapis.com/2.37/chromedriver_win32.zip'
  checksum      = '947ed273fa498ccb5e14dba511d2b2ab0e40fa6ff273af631471402c8aadb01cb921d27c00e9ee87db3744f257745525067113cedf3de9c7c71a2d5a57556fd6'
  checksumType  = 'sha512'
  unzipLocation = $seleniumDir
}
Install-ChocolateyZipPackage @packageArgs

Install-BinFile -Name 'chromedriver' -Path $driverPath

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "$menuPrograms\Selenium\Selenium Chrome Driver.lnk"
  targetPath       = $driverPath
  iconLocation     = "$toolsDir\icon.ico"
}
Install-ChocolateyShortcut @shortcutArgs
