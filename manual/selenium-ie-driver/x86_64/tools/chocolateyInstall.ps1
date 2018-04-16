$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\IEDriverServer.exe"

$packageArgs = @{
  packageName    = 'selenium-ie-driver'
  url            = 'https://selenium-release.storage.googleapis.com/3.11/IEDriverServer_Win32_3.11.1.zip'
  checksum       = '5a47b8bf89dbf3d3a6831c16535831df265802483836637fcf996cd0b41221fc48b6339515d324c903192ecc211006b0c42d0b35aaebd7d1f5d941123a40fc17'
  checksumType   = 'sha512'
  url64bit       = 'https://selenium-release.storage.googleapis.com/3.11/IEDriverServer_x64_3.11.1.zip'
  checksum64     = '9a560f2a32ca51ba91be20aa3de40c2b2b5b3d02b17dfb14fa9dafd14639f7eb0e638c6d84f5a49af5cad3d53d46566a466062c78c12885569bb8ba6476effd6'
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
