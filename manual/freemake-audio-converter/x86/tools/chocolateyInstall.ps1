$packageArgs = @{
  packageName   = 'freemake-audio-converter'
  installerType = 'exe'
  silentArgs    = '/VERYSILENT /NORESTART'
  url           = 'http://packages.chocolatey.adam.gabrys.biz/freemake-audio-converter/freemake-audio-converter-1.1.8.7.exe'
  checksum      = '88e84f1712542b729c228a52cc5e9aa5'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs
