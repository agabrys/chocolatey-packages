$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$appDir = "$toolsDir\app"

$packageArgs = @{
  packageName   = 'wavosaur-x64'
  url           = 'http://www.wavosaur.com/download/files/Wavosaur.1.1.0.0-x64(en).zip'
  checksum      = '1cd1f1fefa7315fe465ac46ac1d26e14'
  checksumType  = 'md5'
  unzipLocation = $appDir
}

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shotrcutArgs = @{
  shortcutFilePath = "$menuPrograms\Wavosaur x64.lnk"
  targetPath       = "$appDir\Wavosaur.exe"
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut @shotrcutArgs
