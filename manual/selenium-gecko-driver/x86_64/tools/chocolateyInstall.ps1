$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\geckodriver.exe"

$packageArgs = @{
  packageName    = 'selenium-gecko-driver'
  url            = 'https://github.com/mozilla/geckodriver/releases/download/v0.20.1/geckodriver-v0.20.1-win32.zip'
  checksum       = 'fd9eeeec9265344f2aed21b1ec696005dcbcc3d60edbad7c0d289729b6a846f2e5b0740f3b280d97b3ffbbf4cbae8e949e55e3f1ac61b7d6dc278a0a1635f0a6'
  checksumType   = 'sha512'
  url64bit       = 'https://github.com/mozilla/geckodriver/releases/download/v0.20.1/geckodriver-v0.20.1-win64.zip'
  checksum64     = 'c465b77aaafc5ce2e4ce21955a8182ab3a9ca9e66300401ae48e64bd1bfd2d1e06f95a3dfabcf7f19567991a45d6ba202a741a925bfbc2cab8b4e99b3ad42045'
  checksumType64 = 'sha512'
  unzipLocation  = $seleniumDir
}
Install-ChocolateyZipPackage @packageArgs

Install-BinFile -Name 'geckodriver' -Path $driverPath

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "$menuPrograms\Selenium\Selenium Gecko Driver.lnk"
  targetPath       = $driverPath
  iconLocation     = "$toolsDir\icon.ico"
}
Install-ChocolateyShortcut @shortcutArgs
