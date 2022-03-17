$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$appDir = "${toolsDir}\app"

$packageArgs = @{
  packageName  = 'burp-suite-free-edition'
  fileFullPath = "${appDir}\burpsuite.jar"
  url          = 'https://portswigger.net/Burp/Releases/Download?productId=100&version=2022.1&type=jar'
  checksum     = '86df7ff4ba88d97edd72072a794a5d31f09ebabbb072ba62ea9734a6f3624965362d8f47deeac972381d75947734ab4acd87d2b6ee825999a683341903d6ddcb'
  checksumType = 'sha512'
}
Get-ChocolateyWebFile @packageArgs
$env:ChocolateyPackageInstallLocation = $appDir

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "${menuPrograms}\Burp Suite Community Edition.lnk"
  targetPath       = '%JAVA_HOME%\bin\javaw.exe'
  arguments        = "--add-opens=java.desktop/javax.swing=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED -jar `"${appDir}\burpsuite.jar`""
  iconLocation     = "${toolsDir}\icon.ico"
}
Install-ChocolateyShortcut @shortcutArgs
