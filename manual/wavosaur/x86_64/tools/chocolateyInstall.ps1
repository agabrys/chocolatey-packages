$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$appDir = "$toolsDir\app"

$packageArgs = @{
  packageName    = 'wavosaur'
  url            = 'http://www.wavosaur.com/download/files/Wavosaur.1.1.0.0-x86(en).zip'
  checksum       = 'ceec5466a641dcd77f026db99779141d'
  checksumType   = 'md5'
  url64bit       = 'http://www.wavosaur.com/download/files/Wavosaur.1.1.0.0-x64(en).zip'
  checksum64     = '1cd1f1fefa7315fe465ac46ac1d26e14'
  checksumType64 = 'md5'
  unzipLocation  = $appDir
}

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shotrcutArgs = @{
  shortcutFilePath = "$menuPrograms\Wavosaur.lnk"
  targetPath       = "$appDir\Wavosaur.exe"
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut @shotrcutArgs
