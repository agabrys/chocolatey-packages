$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = "$menuPrograms\Burp Suite Community Edition.lnk"

If (Test-Path -Path $shortcutFilePath) {
  Remove-Item -Path $shortcutFilePath
}
