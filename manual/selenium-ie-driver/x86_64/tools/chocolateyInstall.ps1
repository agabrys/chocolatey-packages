$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\IEDriverServer.exe"

$packageArgs = @{
  packageName    = 'selenium-ie-driver'
  url            = 'https://selenium-release.storage.googleapis.com/3.10/IEDriverServer_Win32_3.10.0.zip'
  checksum       = '5497b11b688c475d386d56853a63a327be8c02229d1edc79baa0ecb38de865a0a2fff477ab30412146f49e46af7792f425c5e68345e1cee829f76303e8d95538'
  checksumType   = 'sha512'
  url64bit       = 'https://selenium-release.storage.googleapis.com/3.10/IEDriverServer_x64_3.10.0.zip'
  checksum64     = 'fff686728b09b24e4225c1c04140f1b92ac508929fdc086a462650584e783489aa90f7886cff701e7da1dda6d9a6236b0252f76437e099b6cb06ae1b15ad4834'
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
