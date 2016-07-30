$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$appDir = "$toolsDir\app"

$packageArgs = @{
  packageName  = 'wiztools-rest-client-ui'
  fileFullPath = "$appDir\restclient.jar"
  url          = 'https://github.com/wiztools/rest-client/releases/download/3.6.1/restclient-ui-fat-3.6.1.jar'
  checksum     = 'fe6704668d4192924d3789e56c44e2d4'
  checksumType = 'md5'
}

Get-ChocolateyWebFile @packageArgs

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$wshShell = New-Object -comObject WScript.Shell
$shortcut = $wshShell.CreateShortcut("$menuPrograms\WizTools.org RESTClient.lnk")
$shortcut.TargetPath = "javaw.exe"
$Shortcut.Arguments = "-jar `"$appDir\restclient.jar`""
$shortcut.IconLocation = "$toolsDir\icon.ico"
$shortcut.Save()
