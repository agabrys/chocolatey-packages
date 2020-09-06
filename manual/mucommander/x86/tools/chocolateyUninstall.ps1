$path = Get-AppInstallLocation muCommander

$packageArgs = @{
  packageName = 'mucommander'
  fileType    = 'exe'
  silentArgs  = '/S'
  file        = "${path}\uninstall.exe"
}
Uninstall-ChocolateyPackage @packageArgs
