$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tmpDir = "$toolsDir\temp"

$packageArgs = @{
  packageName    = 'selenium-ie-driver'
  url            = 'http://selenium-release.storage.googleapis.com/2.53/IEDriverServer_Win32_2.53.1.zip'
  checksum       = '35ac005f9088f2995d6a1cdc384fe4cb'
  checksumType   = 'md5'
  url64bit       = 'http://selenium-release.storage.googleapis.com/2.53/IEDriverServer_x64_2.53.1.zip'
  checksum64     = '6c822788a04e4e8d4727dc4c08c0102a'
  checksumType64 = 'md5'
  unzipLocation  = $tmpDir	
}

Install-ChocolateyZipPackage @packageArgs

$binRoot = Get-BinRoot
$seleniumDir = "$binRoot\selenium"
$driverPath = "$seleniumDir\IEDriverServer.exe"

If (!(Test-Path -Path $seleniumDir)) {
  New-Item $seleniumDir -ItemType directory
}
Move-Item $tmpDir\IEDriverServer.exe $driverPath -Force
Remove-Item $tmpDir -Recurse -Force

$oldDriverPath = "$seleniumDir\ie-driver.exe"
If (Test-Path -Path $oldDriverPath) {
  Remove-Item $oldDriverPath -Force
}

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "$menuPrograms\Selenium\Selenium Internet Explorer Driver.lnk"
  targetPath       = $driverPath
  iconLocation     = "$toolsDir\icon.ico"
}

Install-ChocolateyShortcut @shortcutArgs
