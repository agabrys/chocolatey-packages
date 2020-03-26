$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$oldAppDir = "$toolsDir\app"
If (Test-Path $oldAppDir) {
  Remove-Item -Path $oldAppDir -Recurse -Force
}

$appDir = "$(Get-ToolsLocation)\wavosaur"

$packageArgs = @{
  packageName    = 'wavosaur'
  url            = 'https://www.wavosaur.com/download/files/Wavosaur.1.4.0.0-x86.zip'
  checksum       = '6ffdc58af985afc7b4ead991afebbd61ff84cd75a7fc5d49de3631b1ba4b46e3edb8bc732b2f3a0702882006de95b8a498bb8f70b578fecdab3d0486c6eaf744'
  checksumType   = 'sha512'
  url64bit       = 'https://www.wavosaur.com/download/files/Wavosaur.1.4.0.0-x64.zip'
  checksum64     = '19a9ede07ac162e9ab09d5ba5cfaab470de3ef9ec6dc89308c3765e7b3518896196f476ba57b49382a003a8815526343b4a73436aabc77b96273413ebd5b21c5'
  checksumType64 = 'sha512'
  unzipLocation  = $appDir
}

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shotrcutArgs = @{
  shortcutFilePath = "$menuPrograms\Wavosaur.lnk"
  targetPath       = "$appDir\Wavosaur.exe"
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut @shotrcutArgs
