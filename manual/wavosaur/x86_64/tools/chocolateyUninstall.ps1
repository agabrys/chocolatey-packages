$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = "${menuPrograms}\Wavosaur.lnk"
If (Test-Path -Path $shortcutFilePath) {
  Remove-Item -Path $shortcutFilePath -Force
}

$appDir = "$(Get-ToolsLocation)\wavosaur"
If (Test-Path -Path $appDir) {
  Remove-Item -Path $appDir -Recurse -Force
}
