$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$appDir = "${toolsDir}\app"

$packageArgs = @{
  packageName  = 'burp-suite-free-edition'
  fileFullPath = "${appDir}\burpsuite.jar"
  url          = 'https://portswigger.net/Burp/Releases/Download?productId=100&version=2022.2.2&type=jar'
  checksum     = 'ac74a781d49ff079fe77b07024d19754fa05cc64834221e5724f3cee713c6899a5bb9f194ce589b1dba00ac7c65703a9a4c3cedb485f794172fc10be8c024cc5'
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
