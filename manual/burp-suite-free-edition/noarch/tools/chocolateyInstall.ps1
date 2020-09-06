$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$appDir = "${toolsDir}\app"

$packageArgs = @{
  packageName  = 'burp-suite-free-edition'
  fileFullPath = "${appDir}\burpsuite.jar"
  url          = 'https://portswigger.net/Burp/Releases/Download?productId=100&version=2020.9.1&type=jar'
  checksum     = '50b9aca8ed3e2e276fc7c444647f8ce9cb5565918547ae801659be146bbe963e9e2e7e6d27d19a4b4aa378f8e47244f43904025e562c18d0a31421a33977f61e'
  checksumType = 'sha512'
}
Get-ChocolateyWebFile @packageArgs
$env:ChocolateyPackageInstallLocation = $appDir

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "$menuPrograms\Burp Suite Community Edition.lnk"
  targetPath       = "$env:JAVA_HOME\bin\javaw.exe"
  arguments        = "-jar `"${appDir}\burpsuite.jar`""
  iconLocation     = "$toolsDir\icon.ico"
}
Install-ChocolateyShortcut @shortcutArgs
