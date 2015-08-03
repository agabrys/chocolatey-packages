$packageArgs = @{
  packageName   = 'freemake-audio-converter'
  installerType = 'exe'
  silentArgs    = '/VERYSILENT /NORESTART'
  url           = 'http://download.freemake.net/FreemakeOriginals2/FreemakeAudioConverterSetup.exe'
  checksum      = '3c6ab60196c6f2089db468e1e7098dec'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs
