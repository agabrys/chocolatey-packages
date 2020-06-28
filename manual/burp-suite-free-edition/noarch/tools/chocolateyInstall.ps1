$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$appDir = "$toolsDir\app"

$packageArgs = @{
  packageName  = 'burp-suite-free-edition'
  fileFullPath = "$appDir\burpsuite.jar"
  url          = 'https://portswigger.net/Burp/Releases/Download?productId=100&version=2020.5.1&type=jar'
  checksum     = '2ba215ce356a95eb0a9ff1de0e6cfd1bcd5a41f849790fb3e8e9385c1a412d61822dc20f30f96fc98aedc82bdbe48681872f789c34b715747b15e7f18050362d'
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
