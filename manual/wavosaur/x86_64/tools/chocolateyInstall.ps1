$version = "1.7.0.0"
$checksumX64 = 'd23c2a267994faee2ac64001948619f291c08c78e743695e6380da03c16aec523a561bf7f83fb07c4d8ae9b577a823b331d5395703c04e713c238e106b6fdabf'
$checksumX86 = '293598652f6193428eebdb37c68da8000ae27c0180cc4d4a5b24dca439a3124641703f45c20bccbffbfaf0fdea4d20aeedb36d23ddd474a5058dcf2b62ae6188'

$appDir = "$(Get-ToolsLocation)\wavosaur"

If (Test-Path -Path $appDir) {
  Remove-Item -Path "${appDir}\*" -Include @('Wavosaur.exe', '*.dll', 'readme.txt') -Force
}

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$tmpDir = "${toolsDir}\tmp"

$packageArgs = @{
  packageName    = 'wavosaur'
  url            = "https://www.wavosaur.com/download/files/Wavosaur.${version}-x86.zip"
  checksum       = $checksumX86
  checksumType   = 'sha512'
  url64bit       = "https://www.wavosaur.com/download/files/Wavosaur.${version}-x64.zip"
  checksum64     = $checksumX64
  checksumType64 = 'sha512'
  unzipLocation  = "${tmpDir}\zip"
}
Install-ChocolateyZipPackage @packageArgs

If (Get-ProcessorBits 64) {
  If ($env:chocolateyForceX86) {
      $architecture = 86
  } Else {
      $architecture = 64
  }
} Else {
  If ($env:chocolateyForceX64) {
      $architecture = 64
  } Else {
      $architecture = 86
  }
}
If (!(Test-Path -Path $appDir)) {
  New-Item -Path $appDir -ItemType directory
}
Get-ChildItem -Path "${tmpDir}\zip\Wavosaur.${version}-x${architecture}" | Move-Item -Destination $appDir -Force
$env:ChocolateyPackageInstallLocation = $appDir

$exeFile = "${appDir}\Wavosaur.exe"
Install-BinFile -Name 'wavosaur' -Path $exeFile
$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shotrcutArgs = @{
  shortcutFilePath = "${menuPrograms}\Wavosaur.lnk"
  targetPath       = $exeFile
}
Install-ChocolateyShortcut @shotrcutArgs

Remove-Item -Path $tmpDir -Recurse -Force
