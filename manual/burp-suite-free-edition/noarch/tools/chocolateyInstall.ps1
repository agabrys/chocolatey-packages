$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$appDir = "${toolsDir}\app"

$packageArgs = @{
  packageName  = 'burp-suite-free-edition'
  fileFullPath = "${appDir}\burpsuite.jar"
  url          = 'https://portswigger.net/Burp/Releases/Download?productId=100&version=2021.7.2&type=jar'
  checksum     = '6c26e881a1502e9936819da6ccbd37a83229e23dfe8b41b743f526adfde611f9cef6d4ee82a611b835ef44eed0da9c2dc564682d6b8c2b03d10940586eb6c373'
  checksumType = 'sha512'
}
Get-ChocolateyWebFile @packageArgs
$env:ChocolateyPackageInstallLocation = $appDir

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "${menuPrograms}\Burp Suite Community Edition.lnk"
  targetPath       = "${env:JAVA_HOME}\bin\javaw.exe"
  arguments        = "-jar `"${appDir}\burpsuite.jar`""
  iconLocation     = "${toolsDir}\icon.ico"
}
Install-ChocolateyShortcut @shortcutArgs
