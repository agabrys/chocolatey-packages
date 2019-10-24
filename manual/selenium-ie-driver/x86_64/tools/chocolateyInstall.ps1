$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\IEDriverServer.exe"

$parameters = Get-PackageParameters

$packageArgs = @{
  packageName    = 'selenium-ie-driver'
  url            = 'https://selenium-release.storage.googleapis.com/3.150/IEDriverServer_Win32_3.150.0.zip'
  checksum       = 'aad9c18f3e6506f8173b1b1edeb5fe1cd71efe26e5db7bbb1d6dc74b585486568a4781b6066843862ee07f1e65a0ab9a87fca05aa0b7bf9ad9b5b31ad311cd5b'
  checksumType   = 'sha512'
  url64bit       = 'https://selenium-release.storage.googleapis.com/3.150/IEDriverServer_x64_3.150.0.zip'
  checksum64     = 'e8343a24a0905ca6fb371119b8fb5567168021683bddf09ae752df2664206b058549e6cd984bfe78520873f386765311c5e908c43f14da6d6ca208d2feccf790'
  checksumType64 = 'sha512'
  unzipLocation  = $seleniumDir
}
Install-ChocolateyZipPackage @packageArgs

Uninstall-BinFile -Name 'IEDriverServer'
If ($parameters['SkipShim'] -ne 'true') {
  Install-BinFile -Name 'IEDriverServer' -Path $driverPath
}

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "$menuPrograms\Selenium\Selenium Internet Explorer Driver.lnk"
  targetPath       = $driverPath
  iconLocation     = "$toolsDir\icon.ico"
}
Install-ChocolateyShortcut @shortcutArgs
