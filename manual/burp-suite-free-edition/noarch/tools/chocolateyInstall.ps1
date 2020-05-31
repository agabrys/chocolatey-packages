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
$shortcutArgs = @{
  shortcutFilePath = "$menuPrograms\Burp Suite Community Edition.lnk"
  targetPath       = "$env:JAVA_HOME\bin\javaw.exe"
  arguments        = "-jar `"$appDir\burpsuite.jar`""
  iconLocation     = "$toolsDir\icon.ico"
}
Install-ChocolateyShortcut @shortcutArgs
