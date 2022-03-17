$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$appDir = "${toolsDir}\app"

$packageArgs = @{
  packageName  = 'burp-suite-free-edition'
  fileFullPath = "${appDir}\burpsuite.jar"
  url          = 'https://portswigger.net/Burp/Releases/Download?productId=100&version=2021.12&type=jar'
  checksum     = 'f4efaa43652215a167cd1dcf83f74d805115f6d43e5dd71742c969dc386f72057033802db70b0e7d6fd8754d22d609585fafae3eda842ba26ad71f201f750d32'
  checksumType = 'sha512'
}
Get-ChocolateyWebFile @packageArgs
$env:ChocolateyPackageInstallLocation = $appDir

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "${menuPrograms}\Burp Suite Community Edition.lnk"
  targetPath       = '%JAVA_HOME%\bin\javaw.exe'
  arguments        = "-jar `"${appDir}\burpsuite.jar`""
  iconLocation     = "${toolsDir}\icon.ico"
}
Install-ChocolateyShortcut @shortcutArgs
