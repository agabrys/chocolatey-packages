$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$appDir = "$toolsDir\app"

$packageArgs = @{
  packageName   = 'wiztools-rest-client-ui'
  fileFullPath  = "$appDir\restclient.jar"
  url           = 'https://github.com/wiztools/rest-client/releases/download/3.6/restclient-ui-fat-3.6.jar'
  checksum      = 'f8ae86f55c7c2140748a0cfae8a2e5ad'
  checksumType  = 'md5'
}

Get-ChocolateyWebFile @packageArgs

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$wshShell = New-Object -comObject WScript.Shell
$shortcut = $wshShell.CreateShortcut("$menuPrograms\WizTools.org RESTClient.lnk")
$shortcut.TargetPath = "javaw.exe"
$Shortcut.Arguments = "-jar `"$appDir\restclient.jar`""
$shortcut.IconLocation = "$toolsDir\icon.ico"
$shortcut.Save()
