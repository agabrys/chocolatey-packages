$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\IEDriverServer.exe"

$packageArgs = @{
  packageName    = 'selenium-ie-driver'
  url            = 'https://selenium-release.storage.googleapis.com/3.11/IEDriverServer_Win32_3.11.0.zip'
  checksum       = 'e973736f209811106ff557d4ec2cdcc61f275b6b620057006cda5569f857a385e8586e03e72b5ecee38a3b1f4c29b5dd84168b5136ae19bbf880d263cb3ba94d'
  checksumType   = 'sha512'
  url64bit       = 'https://selenium-release.storage.googleapis.com/3.11/IEDriverServer_x64_3.11.0.zip'
  checksum64     = '50c12f4ad120d9c0977be72122a4a96ffc66070a329532fcf714ff91bdfe4b5be0a665d6c63ed99dc80b4ae19194959a8726da95b9366dd097b6c4279e1805e7'
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
