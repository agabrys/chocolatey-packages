$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$appDir = "${toolsDir}\app"

$packageArgs = @{
  packageName  = 'burp-suite-free-edition'
  fileFullPath = "${appDir}\burpsuite.jar"
  url          = 'https://portswigger.net/Burp/Releases/Download?productId=100&version=2020.8&type=jar'
  checksum     = '850b25b76b21cb3f2cf4d08c046d38456067af34f35cf28bd70c8315437900f756cf6198c06552dfbdb686bf7281afa0a5888750bcd8a0f7f9ad07eb5f6ab154'
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
