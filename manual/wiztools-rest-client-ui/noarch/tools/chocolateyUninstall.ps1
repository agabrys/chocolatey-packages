$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = "${menuPrograms}\WizTools.org RESTClient.lnk"
If (Test-Path -Path $shortcutFilePath) {
  Remove-Item -Path $shortcutFilePath -Force
}
