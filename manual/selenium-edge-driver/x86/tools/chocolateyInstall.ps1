$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\MicrosoftWebDriver.exe"

$parameters = Get-PackageParameters

$packageArgs = @{
  packageName  = 'selenium-edge-driver'
  url          = 'https://download.microsoft.com/download/F/8/A/F8AF50AB-3C3A-4BC4-8773-DC27B32988DD/MicrosoftWebDriver.exe'
  checksum     = '8210b744879b865f9c0e0d09f6a09689a156cf67c3dfaccf8d56cf2bdc8b97181d544e5a83d8eafa67113f3aa68ca7870df98f9fa0f16ee628b40b411ddef985'
  checksumType = 'sha512'
  fileFullPath = $driverPath
}
Get-ChocolateyWebFile @packageArgs

Uninstall-BinFile -Name 'MicrosoftWebDriver'
If ($parameters['SkipShim'] -ne 'true') {
  Install-BinFile -Name 'MicrosoftWebDriver' -Path $driverPath
}

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "$menuPrograms\Selenium\Selenium Edge Driver.lnk"
  targetPath       = $driverPath
  iconLocation     = "$toolsDir\icon.ico"
}
Install-ChocolateyShortcut @shortcutArgs
