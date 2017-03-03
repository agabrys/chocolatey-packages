$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$appDir = "$toolsDir\app"

$packageArgs = @{
  packageName  = 'burp-suite-free-edition'
  fileFullPath = "$appDir\burpsuite.jar"
  url          = 'https://portswigger.net/Burp/Releases/Download?productId=100&version=1.7.18&type=Jar'
  checksum     = '95ba0c1cb3b0de11a0bbc391bdb565bf'
  checksumType = 'md5'
}

Get-ChocolateyWebFile @packageArgs

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$wshShell = New-Object -comObject WScript.Shell
$shortcut = $wshShell.CreateShortcut("$menuPrograms\Burp Suite Free Edition.lnk")
$shortcut.TargetPath = "javaw.exe"
$Shortcut.Arguments = "-jar `"$appDir\burpsuite.jar`""
$shortcut.IconLocation = "$toolsDir\icon.ico"
$shortcut.Save()
