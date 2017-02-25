$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tmpDir = "$toolsDir\temp"

$packageArgs = @{
  packageName    = 'selenium-ie-driver'
  url            = 'https://selenium-release.storage.googleapis.com/3.1/IEDriverServer_Win32_3.1.0.zip'
  checksum       = 'd2fd01194c6fe38d2e083889d4ce7448'
  checksumType   = 'md5'
  url64bit       = 'https://selenium-release.storage.googleapis.com/3.1/IEDriverServer_x64_3.1.0.zip'
  checksum64     = 'c8b8b4945858039a4d538208c9ab41a5'
  checksumType64 = 'md5'
  unzipLocation  = $tmpDir
}

Install-ChocolateyZipPackage @packageArgs

$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\IEDriverServer.exe"

If (!(Test-Path $seleniumDir)) {
  New-Item $seleniumDir -ItemType directory
}
Move-Item $tmpDir\IEDriverServer.exe $driverPath -Force
Write-Host -ForegroundColor Green Moved driver to $seleniumDir
Remove-Item $tmpDir -Recurse -Force

$oldDriverPath = "$seleniumDir\ie-driver.exe"
If (Test-Path $oldDriverPath) {
  Remove-Item $oldDriverPath -Force
}

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "$menuPrograms\Selenium\Selenium Internet Explorer Driver.lnk"
  targetPath       = $driverPath
  iconLocation     = "$toolsDir\icon.ico"
}

Install-ChocolateyShortcut @shortcutArgs
