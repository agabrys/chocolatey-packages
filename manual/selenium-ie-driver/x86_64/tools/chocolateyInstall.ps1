$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\IEDriverServer.exe"

$packageArgs = @{
  packageName    = 'selenium-ie-driver'
  url            = 'https://selenium-release.storage.googleapis.com/3.7/IEDriverServer_Win32_3.7.0.zip'
  checksum       = '2d1f7e7043c1d857660f4117be03f6be128c682ed551fb3681be5e11dbc33aa46ffa6c9002add1a4ba5a82dfcbc5fad1498058efecd8f2d2242c1b2a2c60da7a'
  checksumType   = 'sha512'
  url64bit       = 'https://selenium-release.storage.googleapis.com/3.7/IEDriverServer_x64_3.7.0.zip'
  checksum64     = '08fc9a950be11490b44c94e49bcf590300ac556a09274e9e55f3a6e85a7733d236de4201d03ab0ab2ccb75b34f8b54d9f1676af978acfaa4459b85face7e2976'
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
