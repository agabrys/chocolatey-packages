$packageArgs = @{
  packageName   = 'freemake-audio-converter'
  installerType = 'exe'
  silentArgs    = '/VERYSILENT /NORESTART'
  url           = 'http://download.freemake.net/FreemakeOriginals2/FreemakeAudioConverterSetup.exe'
}

Install-ChocolateyPackage @packageArgs
