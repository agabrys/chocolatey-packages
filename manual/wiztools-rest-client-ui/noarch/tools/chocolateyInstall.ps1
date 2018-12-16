$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$appDir = "$toolsDir\app"

$packageArgs = @{
  packageName  = 'wiztools-rest-client-ui'
  fileFullPath = "$appDir\restclient.jar"
  url          = 'https://github.com/wiztools/rest-client/releases/download/3.7.1/restclient-ui-fat-3.7.1.jar'
  checksum     = 'c3f90594a192afdbdf1520a1f98ca5c77a3874a26c86f7f6da490bbafd176c930e6148ee0f4eba94758c777f7a35aff5dc17532443f6290c608996d37c93e49e'
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
