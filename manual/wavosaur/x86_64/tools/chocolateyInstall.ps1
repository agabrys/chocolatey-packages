$version = "1.8.0.0"
$checksumX64 = 'a07b3732669b38906e0d7079888389675d3e87859fdeae388f996d263dfdbe94a990b746a7e85a32e9feb333f9d53f83abe953e171c722def9578d8ec50fa25c'
$checksumX86 = 'e7fbccc7ac09d70b4b73bbd071c0f5d0840f30ca575135493a5d066de6b3f814ba1f77432f7d8b8530edd233c889506c2260b1d98a5ba7b7f4983eb7820c236b'

$appDir = "$(Get-ToolsLocation)\wavosaur"

$packageArgs = @{
  packageName    = 'wavosaur'
  url            = "https://www.wavosaur.com/download/files/Wavosaur.${version}-x86.zip"
  checksum       = $checksumX86
  checksumType   = 'sha512'
  url64bit       = "https://www.wavosaur.com/download/files/Wavosaur.${version}-x64.zip"
  checksum64     = $checksumX64
  checksumType64 = 'sha512'
  unzipLocation  = $appDir
}
Install-ChocolateyZipPackage @packageArgs

$exeFile = "${appDir}\Wavosaur.exe"
Install-BinFile -Name 'wavosaur' -Path $exeFile
$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shotrcutArgs = @{
  shortcutFilePath = "${menuPrograms}\Wavosaur.lnk"
  targetPath       = $exeFile
}
Install-ChocolateyShortcut @shotrcutArgs
