$location = Get-AppInstallLocation 'BurpSuiteCommunity'
$packageArgs = @{
  packageName = 'burp-suite-free-edition'
  fileType    = 'exe'
  silentArgs  = '-q'
  file        = "${location}\uninstall.exe"
}
Uninstall-ChocolateyPackage @packageArgs
