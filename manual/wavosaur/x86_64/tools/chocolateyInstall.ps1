$version = "1.6.0.0"
$checksumX86 = 'e22f5776412173a9d54dce34756998329ccb09d0da898bf87425a059366a3cfd1b4d10d5b5837ef9c3bd9b663398567e81a49fea64c539b0f15fd287a8b2f8a4'
$checksumX64 = '23b42d9df92f2b616b3590edf457035b1c1dd6759ca5ff68c53e50d808d29ee06e5d6df34dd7fb6677e16c77f799228e77ba31e87036f9e03eb4f942bc1d0013'

$appDir = "$(Get-ToolsLocation)\wavosaur"

If (Test-Path -Path $appDir) {
  Remove-Item -Path "$appDir\*" -Include @('Wavosaur.exe', '*.dll', 'readme.txt') -Force
}

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
& "$toolsDir\cleanup.ps1"
$tmpDir = "$toolsDir\tmp"

$packageArgs = @{
  packageName    = 'wavosaur'
  url            = "https://www.wavosaur.com/download/files/Wavosaur.$version-x86.zip"
  checksum       = $checksumX86
  checksumType   = 'sha512'
  url64bit       = "https://www.wavosaur.com/download/files/Wavosaur.$version-x64.zip"
  checksum64     = $checksumX64
  checksumType64 = 'sha512'
  unzipLocation  = "$tmpDir\zip"
}
Install-ChocolateyZipPackage @packageArgs

If (Get-ProcessorBits 64) {
  If ($env:chocolateyForceX86) {
      $bits = 32
  } Else {
      $bits = 64
  }
} Else {
  If ($env:chocolateyForceX64) {
      $bits = 64
  } Else {
      $bits = 32
  }
}
Get-ChildItem -Path "$tmpDir\zip\Wavosaur.$version-x$bits" | Move-Item -Destination $appDir -Force
$env:ChocolateyPackageInstallLocation = $appDir

$exeFile = "$appDir\Wavosaur.exe"
Install-BinFile -Name 'wavosaur' -Path $exeFile
$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shotrcutArgs = @{
  shortcutFilePath = "$menuPrograms\Wavosaur.lnk"
  targetPath       = $exeFile
}
Install-ChocolateyShortcut @shotrcutArgs

Remove-Item -Path $tmpDir -Recurse -Force
