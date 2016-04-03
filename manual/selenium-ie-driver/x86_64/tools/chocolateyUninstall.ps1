$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = "$menuPrograms\Selenium\Selenium Internet Explorer Driver.lnk"

If (Test-Path $shortcutFilePath) {
  Remove-Item $shortcutFilePath
}
