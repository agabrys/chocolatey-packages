$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\IEDriverServer.exe"

$packageArgs = @{
  packageName    = 'selenium-ie-driver'
  url            = 'https://selenium-release.storage.googleapis.com/3.6/IEDriverServer_Win32_3.6.0.zip'
  checksum       = 'cab8dd4e1cbe9fd240612fe4474f77046b77f67656218a78fc844a3435104e97de04c6f9c3930a4e5fe273ffa6f2e10ee27d6d03c81574860d968b54cc96acb0'
  checksumType   = 'sha512'
  url64bit       = 'https://selenium-release.storage.googleapis.com/3.6/IEDriverServer_x64_3.6.0.zip'
  checksum64     = 'fa96603e6af7e4038845a85fae006ba486e1c373790a4476d908a8466a0756626dad5bc0c5a3ad6565fea18dde04e62279fd3b22e3b5aef71ede04ee93f0779e'
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
