$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$appDir = "$toolsDir\app"

$packageArgs = @{
  packageName  = 'burp-suite-free-edition'
  fileFullPath = "$appDir\burpsuite.jar"
  url          = 'https://portswigger.net/Burp/Releases/Download?productId=100&version=2020.4&type=jar'
  checksum     = 'd22529fef8fdb809e0b1e96f439b159b9885ab0f211565422850d8576d4d3e8a9f6b8c9db430d4099aa907259a6d7f33c2399794ec46f974d220bee56251c5d8'
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
