$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$appDir = "$toolsDir\app"

$language = (Get-Culture).TwoLetterISOLanguageName;
switch ($language) {
  'fr' {
    $url = 'http://fr.wavosaur.com/download/fichiers/Wavosaur.1.1.0.0-x86(fr).zip'
    $checksum = '1c39d8683ac4656f144c0d98ceaeef95'
    $url64 = 'http://fr.wavosaur.com/download/fichiers/Wavosaur.1.1.0.0-x64(fr).zip'
    $checksum64 = '3d40f31a9e0b440e7a022e52e0017d71'
  }
  default {
    $url = 'http://www.wavosaur.com/download/files/Wavosaur.1.1.0.0-x86(en).zip'
    $checksum = 'ceec5466a641dcd77f026db99779141d'
    $url64 = 'http://www.wavosaur.com/download/files/Wavosaur.1.1.0.0-x64(en).zip'
    $checksum64 = '1cd1f1fefa7315fe465ac46ac1d26e14'
  }
}

$packageArgs = @{
  packageName    = 'wavosaur'
  url            = $url
  checksum       = $checksum
  checksumType   = 'md5'
  url64bit       = $url64
  checksum64     = $checksum64
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
