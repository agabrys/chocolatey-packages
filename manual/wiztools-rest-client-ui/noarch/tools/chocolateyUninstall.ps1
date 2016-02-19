$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = "$menuPrograms\WizTools.org RESTClient.lnk"

If (Test-Path $shortcutFilePath) {
  Remove-Item $shortcutFilePath
}
