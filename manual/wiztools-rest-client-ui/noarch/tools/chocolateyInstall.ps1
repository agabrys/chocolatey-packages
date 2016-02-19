$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$appDir = "$toolsDir\app"

$packageArgs = @{
  packageName   = 'wiztools-rest-client-ui'
  fileFullPath  = "$appDir\restclient.jar"
  url           = 'https://github.com/wiztools/rest-client/releases/download/restclient-3.5/restclient-ui-3.5-jar-with-dependencies.jar'
}

Get-ChocolateyWebFile @packageArgs

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$wshShell = New-Object -comObject WScript.Shell
$shortcut = $wshShell.CreateShortcut("$menuPrograms\WizTools.org RESTClient.lnk")
$shortcut.TargetPath = "javaw.exe"
$Shortcut.Arguments = "-jar `"$appDir\restclient.jar`""
$shortcut.IconLocation = "$toolsDir\icon.ico"
$shortcut.Save()
