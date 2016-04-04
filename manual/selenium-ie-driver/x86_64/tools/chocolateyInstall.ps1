$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tmpDir = "$toolsDir\temp"

$packageArgs = @{
  packageName   = 'selenium-ie-driver'
  url           = 'http://selenium-release.storage.googleapis.com/2.53/IEDriverServer_Win32_2.53.0.zip'
  checksum      = '63066830741d59ae6c74045a9f24291c'
  checksumType  = 'md5'
  url64bit       = 'http://selenium-release.storage.googleapis.com/2.53/IEDriverServer_x64_2.53.0.zip'
  checksum64     = '0acce304cbd05a25ba6f11f7c8b9311c'
  checksumType64 = 'md5'
  unzipLocation  = $tmpDir	
}

Install-ChocolateyZipPackage @packageArgs

$binRoot = Get-BinRoot
$seleniumDir = "$binRoot\selenium"
$driverPath = "$seleniumDir\ie-driver.exe"

If (!(Test-Path -Path $seleniumDir)) {
  New-Item $seleniumDir -ItemType directory
}
Move-Item $tmpDir\IEDriverServer.exe $driverPath -Force
Remove-Item $tmpDir -Recurse -Force

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "$menuPrograms\Selenium\Selenium Internet Explorer Driver.lnk"
  targetPath       = $driverPath
  iconLocation     = "$toolsDir\icon.ico"
}

Install-ChocolateyShortcut @shortcutArgs
