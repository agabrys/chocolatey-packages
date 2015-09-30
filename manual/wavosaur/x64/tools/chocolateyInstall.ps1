$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$appDir = "$toolsDir\app"

$language = (Get-Culture).TwoLetterISOLanguageName;
switch ($language) {
  'fr' {
    $url = 'http://fr.wavosaur.com/download/fichiers/Wavosaur.1.1.0.0-x64(fr).zip'
    $checksum = '3d40f31a9e0b440e7a022e52e0017d71'
  }
  default {
    $url = 'http://www.wavosaur.com/download/files/Wavosaur.1.1.0.0-x64(en).zip'
    $checksum = '1cd1f1fefa7315fe465ac46ac1d26e14'
  }
}

$packageArgs = @{
  packageName   = 'wavosaur-x64'
  url           = $url
  checksum      = $checksum
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
