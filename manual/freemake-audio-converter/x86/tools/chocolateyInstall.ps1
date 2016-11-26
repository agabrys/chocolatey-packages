$packageArgs = @{
  packageName   = 'freemake-audio-converter'
  installerType = 'exe'
  silentArgs    = '/VERYSILENT /NORESTART'
  url           = 'http://packages.chocolatey.adam.gabrys.biz/freemake-audio-converter/freemake-audio-converter-1.1.8.9.exe'
  checksum      = 'fcf30e3600ac968e6b135afc9e187775'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs
