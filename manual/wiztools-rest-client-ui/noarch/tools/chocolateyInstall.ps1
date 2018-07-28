$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$appDir = "$toolsDir\app"

$packageArgs = @{
  packageName  = 'wiztools-rest-client-ui'
  fileFullPath = "$appDir\restclient.jar"
  url          = 'https://github.com/wiztools/rest-client/releases/download/3.6.2/restclient-ui-fat-3.6.2.jar'
  checksum     = '96871ecebb947c2faf60e1e5c883c8e13441228c87e974e1e719da317a776554c3c95ed71a3dbf50825a03c58bbc10d09d5c19a972198fce03248342c4288e05'
  checksumType = 'sha512'
}

Get-ChocolateyWebFile @packageArgs

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$wshShell = New-Object -comObject WScript.Shell
$shortcut = $wshShell.CreateShortcut("$menuPrograms\WizTools.org RESTClient.lnk")
$shortcut.TargetPath = "javaw.exe"
$Shortcut.Arguments = "-jar `"$appDir\restclient.jar`""
$shortcut.IconLocation = "$toolsDir\icon.ico"
$shortcut.Save()
