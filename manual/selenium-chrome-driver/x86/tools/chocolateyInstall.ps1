$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\chromedriver.exe"

$packageArgs = @{
  packageName   = 'selenium-chrome-driver'
  url           = 'https://chromedriver.storage.googleapis.com/2.36/chromedriver_win32.zip'
  checksum      = '17d485ab082b5c07d4d0d9894616a94fac5cef8ceaaf840ced07f617d274d8bfa4538610a2eea6ab3ba1e024cd8f8c28b600fb5b49b4206f1790c039f5a34f89'
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
