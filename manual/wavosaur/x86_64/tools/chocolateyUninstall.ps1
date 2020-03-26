$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = "$menuPrograms\Wavosaur.lnk"
If (Test-Path $shortcutFilePath) {
  Remove-Item $shortcutFilePath -Force
}

$appDir = "$(Get-ToolsLocation)\wavosaur"
If (Test-Path $appDir) {
  Remove-Item -Path $appDir -Recurse -Force
}
