$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tmpDir = "$toolsDir\temp"

$packageArgs = @{
  packageName   = 'selenium-chrome-driver'
  url           = 'https://chromedriver.storage.googleapis.com/2.33/chromedriver_win32.zip'
  checksum      = 'cbe079e82756b207faef5d592d328f3b46aa36b8d5caabe0bbac5acecce208d4aef42d68a30ec23a873c5bab398618145c8b6fcfd9bcd0a6f93cb1c70b3320d5'
  checksumType  = 'sha512'
  unzipLocation = $tmpDir
}

Install-ChocolateyZipPackage @packageArgs

$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\chromedriver.exe"

If (!(Test-Path $seleniumDir)) {
  New-Item $seleniumDir -ItemType directory
}
Move-Item $tmpDir\chromedriver.exe $driverPath -Force
Write-Host -ForegroundColor Green Moved driver to $seleniumDir
Remove-Item $tmpDir -Recurse -Force

$oldDriverPath = "$seleniumDir\chrome-driver.exe"
If (Test-Path $oldDriverPath) {
  Remove-Item $oldDriverPath -Force
}

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "$menuPrograms\Selenium\Selenium Chrome Driver.lnk"
  targetPath       = $driverPath
  iconLocation     = "$toolsDir\icon.ico"
}

Install-ChocolateyShortcut @shortcutArgs
