$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$appDir = "$toolsDir\app"

$packageArgs = @{
  packageName  = 'wiztools-rest-client-ui'
  fileFullPath = "$appDir\restclient.jar"
  url          = 'https://github.com/wiztools/rest-client/releases/download/3.7.0/restclient-ui-fat-3.7.0.jar'
  checksum     = 'a77f0e3092c29c1c5aa5485998ba05c26ad7b82bdec85246d7e84686db9e665a4a77fb50d766b9cdb7137fb8e547123d83d5c1fe23ecb4e42cd36a94e16d27d3'
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
