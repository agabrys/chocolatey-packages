try {
	Start-Process javaw.exe -ArgumentList -version
} catch [Exception] {
	throw "Cannot found Java! Please install it or package with JRE dependence: burp-suite-free-edition-with-jre"
}

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$appDir = "$toolsDir\app"

$packageArgs = @{
  packageName   = 'burp-suite-free-edition'
  fileFullPath  = "$appDir\burpsuite.jar"
  url           = 'https://portswigger.net/DownloadUpdate.ashx?Product=Free'
}

Get-ChocolateyWebFile @packageArgs

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$wshShell = New-Object -comObject WScript.Shell
$shortcut = $wshShell.CreateShortcut("$menuPrograms\Burp Suite Free Edition.lnk")
$shortcut.TargetPath = "javaw.exe"
$Shortcut.Arguments = "-jar `"$appDir\burpsuite.jar`""
$shortcut.IconLocation = "$toolsDir\icon.ico"
$shortcut.Save()
