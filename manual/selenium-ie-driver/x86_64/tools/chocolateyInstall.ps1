$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tmpDir = "$toolsDir\temp"

$packageArgs = @{
  packageName    = 'selenium-ie-driver'
  url            = 'https://selenium-release.storage.googleapis.com/3.5/IEDriverServer_Win32_3.5.1.zip'
  checksum       = '4460663c9bb74c9c089b6a1c4f7e70a56f073fff19dfb98259e5b0b47d0391457ebd5b7c070d956e5456b63a78372f53d2dee0fe7dd9189f685d3d85fc5221a1'
  checksumType   = 'sha512'
  url64bit       = 'https://selenium-release.storage.googleapis.com/3.5/IEDriverServer_x64_3.5.1.zip'
  checksum64     = '2a80bcda603e439a5c42dabc8c860ffde3a5fd14c1a44830f8a095a12e77254bb6ac1abd5cfefcea3b589589232da9fecb9d261dd7264af2ef55eebf8989aebf'
  checksumType64 = 'sha512'
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
