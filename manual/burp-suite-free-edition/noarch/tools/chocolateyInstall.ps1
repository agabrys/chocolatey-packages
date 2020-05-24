$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$appDir = "$toolsDir\app"

$packageArgs = @{
  packageName  = 'burp-suite-free-edition'
  fileFullPath = "$appDir\burpsuite.jar"
  url          = 'https://portswigger.net/Burp/Releases/Download?productId=100&version=2020.4.1&type=jar'
  checksum     = '7ecad2f8fab846632164ed69ecdc0fff5118a305bdea86c30b203a70147e71711b446f59d9f8a5d235773d6c03ff6dfabba0a0d71ffceeaff3a424d24ad82992'
  checksumType = 'sha512'
}
Get-ChocolateyWebFile @packageArgs
$env:ChocolateyPackageInstallLocation = $appDir

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$wshShell = New-Object -ComObject WScript.Shell
$shortcut = $wshShell.CreateShortcut("$menuPrograms\Burp Suite Community Edition.lnk")
$shortcut.TargetPath = "javaw.exe"
$Shortcut.Arguments = "-jar `"$appDir\burpsuite.jar`""
$shortcut.IconLocation = "$toolsDir\icon.ico"
$shortcut.Save()
