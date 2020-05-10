$version = "1.5.0.1"
$checksumX86 = '9e80d2ea9654834ca2dde2f10e43438ab5e5e10dd52661ef91c32b3cc8c8f282fc1bcc63e89b780f81e92593735b83dacc4e212f64857566d2403a1cd9feb402'
$checksumX64 = '5999443df77b9771d2765aeaffe6d6b2cd3768f5bf3dd0ff5b8fa376250f38e01e55f8549fd4b759fc94132af3e3909da0e3908220694a18d78c95061d1d6bdd'

$appDir = "$(Get-ToolsLocation)\wavosaur"
$tmpDir = "$toolsDir\tmp"

If (Test-Path -Path $appDir) {
  Remove-Item -Path "$appDir\*" -Include @('Wavosaur.exe', '*.dll', 'readme.txt') -Force
}

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
& "$toolsDir\cleanup.ps1"

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
