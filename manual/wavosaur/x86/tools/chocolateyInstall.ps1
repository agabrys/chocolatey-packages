$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$appDir = "$toolsDir\app"

$packageArgs = @{
  packageName   = 'wavosaur-x86'
  url           = 'http://www.wavosaur.com/download/files/Wavosaur.1.1.0.0-x86(en).zip'
  checksum      = 'ceec5466a641dcd77f026db99779141d'
  checksumType  = 'md5'
  unzipLocation = $appDir
}

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shotrcutArgs = @{
  shortcutFilePath = "$menuPrograms\Wavosaur x86.lnk"
  targetPath       = "$appDir\Wavosaur.exe"
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut @shotrcutArgs
