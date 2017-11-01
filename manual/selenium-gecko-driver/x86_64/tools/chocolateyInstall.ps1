$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tmpDir = "$toolsDir\temp"

$packageArgs = @{
  packageName    = 'selenium-gecko-driver'
  url            = 'https://github.com/mozilla/geckodriver/releases/download/v0.19.1/geckodriver-v0.19.1-win32.zip'
  checksum       = '7f013f6689baf1ad229b1e2b975c31a7a6b53bed4db868499aa1bdd1003b485c92dc823d058deaec40e6533281a871f1b9b7e6b19faeb23f065b7fed58bebbe0'
  checksumType   = 'sha512'
  url64bit       = 'https://github.com/mozilla/geckodriver/releases/download/v0.19.1/geckodriver-v0.19.1-win64.zip'
  checksum64     = '2f5878c838c9d091805ecb27480f16c468dd47247a890a4384d9dea09d409fdbe616d5b088c8c2187a12a4336ca73a4b1ace3539062961060b29f73a5c7290fb'
  checksumType64 = 'sha512'
  unzipLocation  = $tmpDir
}

Install-ChocolateyZipPackage @packageArgs

$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\geckodriver.exe"

If (!(Test-Path $seleniumDir)) {
  New-Item $seleniumDir -ItemType directory
}
Move-Item $tmpDir\geckodriver.exe $driverPath -Force
Write-Host -ForegroundColor Green Moved driver to $seleniumDir
Remove-Item $tmpDir -Recurse -Force

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "$menuPrograms\Selenium\Selenium Gecko Driver.lnk"
  targetPath       = $driverPath
  iconLocation     = "$toolsDir\icon.ico"
}

Install-ChocolateyShortcut @shortcutArgs
