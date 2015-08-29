$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = "$menuPrograms\Burp Suite Free Edition.lnk"

If (Test-Path $shortcutFilePath) {
  Remove-Item $shortcutFilePath
}
