$uninstaller = '\Freemake\Freemake Audio Converter\Uninstall\unins000.exe'
if ("${Env:ProgramFiles(x86)}") {
  $fullPath = "${Env:ProgramFiles(x86)}\$uninstaller"
} else {
  $fullPath = "${Env:ProgramFiles}\$uninstaller"
}

$packageArgs = @{
  packageName = 'freemake-audio-converter'
  fileType    = 'exe'
  silentArgs  = '/VERYSILENT /NORESTART'
  file        = $fullPath
}

Uninstall-ChocolateyPackage @packageArgs
