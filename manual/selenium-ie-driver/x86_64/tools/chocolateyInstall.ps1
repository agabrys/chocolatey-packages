$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\IEDriverServer.exe"

$parameters = Get-PackageParameters

$packageArgs = @{
  packageName    = 'selenium-ie-driver'
  url            = 'https://selenium-release.storage.googleapis.com/3.13/IEDriverServer_Win32_3.13.0.zip'
  checksum       = '953310fd6ef0904ccfb4ed6fbdc313a14af2ff175961117519ed253f7ec72170bf3a4a646e8b4c7b73e151924ffebdd6be93e7a712f5b2f804e183f69d2a4e92'
  checksumType   = 'sha512'
  url64bit       = 'https://selenium-release.storage.googleapis.com/3.13/IEDriverServer_x64_3.13.0.zip'
  checksum64     = '960346f0e6968958ed851d43d7cbbb401fe571dc5baf35ae78c18c6d1d3e87cda070e5f6d4c43b2f267836b8e97381476415793ab3159d80df7fada68d0fa5b9'
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
