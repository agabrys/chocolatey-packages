$packageArgs = @{
  packageName = 'wavosaur-x86'
  zipFileName = 'Wavosaur.1.1.0.0-x86(en).zip'
}

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = "$menuPrograms\Wavosaur x86.lnk"

UnInstall-ChocolateyZipPackage @packageArgs
If (Test-Path $shortcutFilePath) {
  Remove-Item $shortcutFilePath
}
