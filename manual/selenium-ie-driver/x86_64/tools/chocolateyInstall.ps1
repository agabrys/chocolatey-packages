$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\IEDriverServer.exe"

$parameters = Get-PackageParameters

$packageArgs = @{
  packageName    = 'selenium-ie-driver'
  url            = 'https://selenium-release.storage.googleapis.com/3.141/IEDriverServer_Win32_3.141.59.zip'
  checksum       = '18c7ee540a2673190e1ae01c5c37c439acb6492221185739696f2a0ed30fcca090a82ef620b5cf11d131ec2bc289bbfb92e716b35ae678ddeec9c8826deed5c9'
  checksumType   = 'sha512'
  url64bit       = 'https://selenium-release.storage.googleapis.com/3.141/IEDriverServer_x64_3.141.59.zip'
  checksum64     = '065eaa1e8850a5ea5ffe52fbf95510300a12976a9c6acfbe8dd23f949bcdee47071daed2bd0008e1ccaa863da41c8da640eba82432471c06c07615174d77ac7a'
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
