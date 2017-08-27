$path = Get-AppInstallLocation HipChat4

$packageArgs = @{
  packageName = 'hipchat'
  fileType    = 'exe'
  silentArgs  = '/VerySilent /NoRestart /CloseApplications'
  file        = "${path}\unins000.exe"
}

Uninstall-ChocolateyPackage @packageArgs
