$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$appDir = "$toolsDir\app"

$language = (Get-Culture).TwoLetterISOLanguageName;
switch ($language) {
  'fr' {
    $url = 'http://fr.wavosaur.com/download/fichiers/Wavosaur.1.1.0.0-x86(fr).zip'
    $checksum = '1c39d8683ac4656f144c0d98ceaeef95'
  }
  default {
    $url = 'http://www.wavosaur.com/download/files/Wavosaur.1.1.0.0-x86(en).zip'
    $checksum = 'ceec5466a641dcd77f026db99779141d'
  }
}

$packageArgs = @{
  packageName   = 'wavosaur-x86'
  url           = $url
  checksum      = $checksum
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
