$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$appDir = "$toolsDir\app"

$packageArgs = @{
  packageName    = 'wavosaur'
  url            = 'https://www.wavosaur.com/download/files/Wavosaur.1.3.0.0-x86(en).zip'
  checksum       = 'cf250930100f4e29d1cbb601567b5371'
  checksumType   = 'md5'
  url64bit       = 'https://www.wavosaur.com/download/files/Wavosaur.1.3.0.0-x64(en).zip'
  checksum64     = '899d8ae578b3629ca05d7306a8c3cd85'
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
