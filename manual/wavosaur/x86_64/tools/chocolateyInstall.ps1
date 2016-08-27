$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$appDir = "$toolsDir\app"

$packageArgs = @{
  packageName    = 'wavosaur'
  url            = 'http://www.wavosaur.com/download/files/Wavosaur.1.2.0.0-x86(en).zip'
  checksum       = '067242ac2429f4b02ea933d7483314a6'
  checksumType   = 'md5'
  url64bit       = 'http://www.wavosaur.com/download/files/Wavosaur.1.2.0.0-x64(en).zip'
  checksum64     = 'c616a4f32dfd8ae424017ace7512a4a2'
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
