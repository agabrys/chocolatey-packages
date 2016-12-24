$path = Get-AppInstallLocation HipChat4

$packageArgs = @{
  packageName = 'hipchat'
  fileType    = 'exe'
  silentArgs  = '/VERYSILENT /NORESTART /NOCLOSEAPPLICATIONS /NORESTARTAPPLICATIONS'
  file        = "${path}\unins000.exe"
}

Uninstall-ChocolateyPackage @packageArgs
