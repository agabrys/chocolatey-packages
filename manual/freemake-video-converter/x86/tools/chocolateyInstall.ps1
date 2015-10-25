$packageArgs = @{
  packageName   = 'freemake-video-converter'
  installerType = 'exe'
  silentArgs    = '/VERYSILENT /NORESTART'
  url           = 'http://download.freemake.net/FreemakeOriginals2/FreemakeVideoConverterSetup.exe'
}

Install-ChocolateyPackage @packageArgs
