$uninstaller = '\muCommander\uninstall.exe'
if ("${Env:ProgramFiles(x86)}") {
  $fullPath = "${Env:ProgramFiles(x86)}$uninstaller"
} else {
  $fullPath = "${Env:ProgramFiles}$uninstaller"
}

$packageArgs = @{
  packageName = 'mucommander'
  fileType    = 'exe'
  silentArgs  = '/S'
  file        = $fullPath
}

Uninstall-ChocolateyPackage @packageArgs
