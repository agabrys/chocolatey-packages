$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\IEDriverServer.exe"

$parameters = Get-PackageParameters

$packageArgs = @{
  packageName    = 'selenium-ie-driver'
  url            = 'https://selenium-release.storage.googleapis.com/3.141/IEDriverServer_Win32_3.141.5.zip'
  checksum       = 'bef1727d99cf260e4b5f470e81e73ead644274fdd33281fa79b113ab40074550592b1180ef078b7f2557789f46bf84dd2e80bc8e48d41dcf28e67d6a71749757'
  checksumType   = 'sha512'
  url64bit       = 'https://selenium-release.storage.googleapis.com/3.141/IEDriverServer_x64_3.141.5.zip'
  checksum64     = '39ac66a75b70dbd6731dd25b919cb1bbf84d02b6400fc37efeec7da9a8987687cbba77037c830979147425a7eb9f9d1a0f884a4428e7e766baa9d4f28086fb86'
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
