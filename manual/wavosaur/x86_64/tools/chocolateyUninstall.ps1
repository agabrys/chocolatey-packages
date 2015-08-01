$packageName = 'wavosaur'

$packageArgs86 = @{
  packageName = $packageName
  zipFileName = 'Wavosaur.1.1.0.0-x86(en).zip'
}

$packageArgs64 = @{
  packageName = $packageName
  zipFileName = 'Wavosaur.1.1.0.0-x64(en).zip'
}

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = "$menuPrograms\Wavosaur.lnk"

UnInstall-ChocolateyZipPackage @packageArgs86
UnInstall-ChocolateyZipPackage @packageArgs64
If (Test-Path $shortcutFilePath) {
  Remove-Item $shortcutFilePath
}
