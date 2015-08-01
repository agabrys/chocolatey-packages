$packageArgs = @{
  packageName = 'wavosaur-x64'
  zipFileName = 'Wavosaur.1.1.0.0-x64(en).zip'
}

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = "$menuPrograms\Wavosaur x64.lnk"

UnInstall-ChocolateyZipPackage @packageArgs
If (Test-Path $shortcutFilePath) {
  Remove-Item $shortcutFilePath
}
