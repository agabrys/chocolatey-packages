$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$appDir = "${toolsDir}\app"

$packageArgs = @{
  packageName  = 'burp-suite-free-edition'
  fileFullPath = "${appDir}\burpsuite.jar"
  url          = 'https://portswigger.net/Burp/Releases/Download?productId=100&version=2020.8.1&type=jar'
  checksum     = '172445ea0af46051214b534333210abdba7e08ef15da4036612aec40786c35d0db7d91aaa991a2eb8ddf8424a14d93870081d8cdc98449fcf850379e47faa67b'
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
