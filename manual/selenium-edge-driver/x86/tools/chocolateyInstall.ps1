$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\MicrosoftWebDriver.exe"

$packageArgs = @{
  packageName  = 'selenium-edge-driver'
  url          = 'https://download.microsoft.com/download/D/4/1/D417998A-58EE-4EFE-A7CC-39EF9E020768/MicrosoftWebDriver.exe'
  checksum     = '11eff15b47d417f3831ee1ef78f5d0907f1a29fc5d3fc4dd6fde28bc94369fdf98434e03489398d02fa616c4246e171ba1667f5b164a86df695fea854a852857'
  checksumType = 'sha512'
  fileFullPath = $driverPath
}
Get-ChocolateyWebFile @packageArgs

Install-BinFile -Name 'MicrosoftWebDriver' -Path $driverPath

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "$menuPrograms\Selenium\Selenium Edge Driver.lnk"
  targetPath       = $driverPath
  iconLocation     = "$toolsDir\icon.ico"
}
Install-ChocolateyShortcut @shortcutArgs
