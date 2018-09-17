$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\geckodriver.exe"

$parameters = Get-PackageParameters

$packageArgs = @{
  packageName    = 'selenium-gecko-driver'
  url            = 'https://github.com/mozilla/geckodriver/releases/download/v0.22.0/geckodriver-v0.22.0-win32.zip'
  checksum       = '64b14bbf7500a79313ae7636ccdb7e875ac49e75b4d0502a23521df10a1bf2208148668c0111be128ab04453411b1cb100710adc515bb93d630cc3c8f092c407'
  checksumType   = 'sha512'
  url64bit       = 'https://github.com/mozilla/geckodriver/releases/download/v0.22.0/geckodriver-v0.22.0-win64.zip'
  checksum64     = 'a90bb89623e03de41f34e1f849bdb353fb656c8664da2921b58049c5773b459cd88d4645d6d6685222b3d3b63e90fe9ec38cb66f7a911d6703e86ebf24f57cdb'
  checksumType64 = 'sha512'
  unzipLocation  = $seleniumDir
}
Install-ChocolateyZipPackage @packageArgs

Uninstall-BinFile -Name 'geckodriver'
If ($parameters['SkipShim'] -ne 'true') {
  Install-BinFile -Name 'geckodriver' -Path $driverPath
}

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "$menuPrograms\Selenium\Selenium Gecko Driver.lnk"
  targetPath       = $driverPath
  iconLocation     = "$toolsDir\icon.ico"
}
Install-ChocolateyShortcut @shortcutArgs
