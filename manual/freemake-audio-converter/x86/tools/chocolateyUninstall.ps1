$path = Get-AppInstallLocation 'Freemake Audio Converter'

$packageArgs = @{
  packageName = 'freemake-audio-converter'
  fileType    = 'exe'
  silentArgs  = '/VERYSILENT /NORESTART'
  file        = "$path\Uninstall\unins000.exe"
}
Uninstall-ChocolateyPackage @packageArgs
