$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$appDir = "${toolsDir}\app"

$packageArgs = @{
  packageName  = 'burp-suite-free-edition'
  fileFullPath = "${appDir}\burpsuite.jar"
  url          = 'https://portswigger.net/Burp/Releases/Download?productId=100&version=2021.6&type=jar'
  checksum     = '4b13705a434980df0cf59d614a51eae0555e5a4a0e549f019aad4b63450653d5e40b4cf70bd8486c8ad9c03316dab7b963cc360fb7b4aed0d24869945ed8cda0'
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
