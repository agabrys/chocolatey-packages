$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = "$menuPrograms\Selenium\Selenium Chrome Driver.lnk"

If (Test-Path $shortcutFilePath) {
  Remove-Item $shortcutFilePath
}
