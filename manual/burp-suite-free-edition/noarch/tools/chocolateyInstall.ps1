$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$appDir = "$toolsDir\app"

$packageArgs = @{
  packageName  = 'burp-suite-free-edition'
  fileFullPath = "$appDir\burpsuite.jar"
  url          = 'https://portswigger.net/Burp/Releases/Download?productId=100&version=1.7.30&type=Jar'
  checksum     = 'f50e345fba35a3a576e561944abcbb3dd17fc9cabd66d771082548109da9873ceb8f61708a590ffed12eeed53a21db6c25d490c3f447eb98be97e2a7d4b72859'
  checksumType = 'sha512'
}
Get-ChocolateyWebFile @packageArgs

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$wshShell = New-Object -ComObject WScript.Shell
$shortcut = $wshShell.CreateShortcut("$menuPrograms\Burp Suite Free Edition.lnk")
$shortcut.TargetPath = "javaw.exe"
$Shortcut.Arguments = "-jar `"$appDir\burpsuite.jar`""
$shortcut.IconLocation = "$toolsDir\icon.ico"
$shortcut.Save()
