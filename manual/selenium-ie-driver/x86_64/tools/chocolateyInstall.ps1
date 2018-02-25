$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\IEDriverServer.exe"

$packageArgs = @{
  packageName    = 'selenium-ie-driver'
  url            = 'https://selenium-release.storage.googleapis.com/3.9/IEDriverServer_Win32_3.9.0.zip'
  checksum       = '153da7c8280e19f1799950ab0d9ef1d6fbbf75cbcc24e5f0b30eba19c26c637ce1200c646a732616531ac9ba8b8ae699558fe1dc04dcc10966442dbed37cb52d'
  checksumType   = 'sha512'
  url64bit       = 'https://selenium-release.storage.googleapis.com/3.9/IEDriverServer_x64_3.9.0.zip'
  checksum64     = '6cace962b0be3597cc6269b9b5e1f7863e5faba74cdcb3db83842799fcb1f115f624da344405ae5f58051f8b2d3edb9c88c6d2874de306ac55141c4e2da4af85'
  checksumType64 = 'sha512'
  unzipLocation  = $seleniumDir
}
Install-ChocolateyZipPackage @packageArgs

Install-BinFile -Name 'IEDriverServer' -Path $driverPath

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "$menuPrograms\Selenium\Selenium Internet Explorer Driver.lnk"
  targetPath       = $driverPath
  iconLocation     = "$toolsDir\icon.ico"
}
Install-ChocolateyShortcut @shortcutArgs
