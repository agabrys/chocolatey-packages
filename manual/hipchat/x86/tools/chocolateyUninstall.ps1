$uninstaller = '\Atlassian\HipChat4\unins000.exe'
if ("${Env:ProgramFiles(x86)}") {
  $fullPath = "${Env:ProgramFiles(x86)}$uninstaller"
} else {
  $fullPath = "${Env:ProgramFiles}$uninstaller"
}

$packageArgs = @{
  packageName = 'hipchat'
  fileType    = 'exe'
  silentArgs  = '/VERYSILENT /NORESTART /NOCLOSEAPPLICATIONS /NORESTARTAPPLICATIONS'
  file        = $fullPath
}

Uninstall-ChocolateyPackage @packageArgs
