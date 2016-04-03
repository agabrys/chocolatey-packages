$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = "$menuPrograms\Selenium\Selenium Opera Driver.lnk"

If (Test-Path $shortcutFilePath) {
  Remove-Item $shortcutFilePath
}
