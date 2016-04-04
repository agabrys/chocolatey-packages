$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tmpDir = "$toolsDir\temp"

$packageArgs = @{
  packageName    = 'selenium-opera-driver'
  url            = 'https://github.com/operasoftware/operachromiumdriver/releases/download/v0.2.2/operadriver_win32.zip'
  checksum       = 'c0612082fd2d174e6bdcf2a718f8ad60'
  checksumType   = 'md5'
  url64bit       = 'https://github.com/operasoftware/operachromiumdriver/releases/download/v0.2.2/operadriver_win64.zip'
  checksum64     = 'f7b02eaae2e87ec810f7958ec2518a40'
  checksumType64 = 'md5'
  unzipLocation  = $tmpDir	
}

Install-ChocolateyZipPackage @packageArgs

$binRoot = Get-BinRoot
$seleniumDir = "$binRoot\selenium"
$driverPath = "$seleniumDir\opera-driver.exe"

If (!(Test-Path -Path $seleniumDir)) {
  New-Item $seleniumDir -ItemType directory
}
Move-Item $tmpDir\operadriver.exe $driverPath -Force
Remove-Item $tmpDir -Recurse -Force

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "$menuPrograms\Selenium\Selenium Opera Driver.lnk"
  targetPath       = $driverPath
  iconLocation     = "$toolsDir\icon.ico"
}

Install-ChocolateyShortcut @shortcutArgs
