$version = "1.5.0.0"
$checksumX86 = 'c6a9a9c4750c0dec75331efa2be897b6b5781a18047c461ae17c73b5734fe5c191435bf5a60a66e380a5ec7483ee4f3686be4eccbb6e812f9cd32461f5f1c22c'
$checksumX64 = '0dda5a270f2ca16227b467bd2f0de3fa0f3703fedb82ab92d6f349f6255a59cdd27a517a66ef6d2f0642ab78096449a3e50dfc9c55e49ac61ed9f6ce2848142d'

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
