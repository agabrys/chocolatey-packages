$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = "$menuPrograms\Wavosaur.lnk"

If (Test-Path $shortcutFilePath) {
  Remove-Item $shortcutFilePath
}
