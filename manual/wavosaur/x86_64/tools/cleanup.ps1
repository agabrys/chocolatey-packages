Uninstall-BinFile -Name 'wavosaur'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$oldAppDir = "$toolsDir\app"
If (Test-Path -Path $oldAppDir) {
  Remove-Item -Path $oldAppDir -Recurse -Force
}

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = "$menuPrograms\Wavosaur.lnk"
If (Test-Path -Path $shortcutFilePath) {
  Remove-Item -Path $shortcutFilePath -Force
}
