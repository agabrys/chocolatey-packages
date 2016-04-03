$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tmpDir = "$toolsDir\temp"

$packageArgs = @{
  packageName   = 'selenium-chrome-driver'
  url           = 'http://chromedriver.storage.googleapis.com/2.21/chromedriver_win32.zip'
  checksum      = '8a93dc3ff02ef9bc3161dd4b20f87215'
  checksumType  = 'md5'
  unzipLocation  = $tmpDir	
}

Install-ChocolateyZipPackage @packageArgs
New-Item $toolsDir\bin -ItemType directory
Move-Item $tmpDir\chromedriver.exe $toolsDir\bin\driver.exe -Force
Remove-Item $tmpDir -Recurse -Force

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "$menuPrograms\Selenium\Selenium Chrome Driver.lnk"
  targetPath       = "$toolsDir\bin\driver.exe"
  iconLocation     = "$toolsDir\icon.ico"
}

Install-ChocolateyShortcut @shortcutArgs
