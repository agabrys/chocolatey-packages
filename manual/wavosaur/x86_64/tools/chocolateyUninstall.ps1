$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
& "$toolsDir\cleanup.ps1"

$appDir = "$(Get-ToolsLocation)\wavosaur"
If (Test-Path -Path $appDir) {
  Remove-Item -Path $appDir -Recurse -Force
}
