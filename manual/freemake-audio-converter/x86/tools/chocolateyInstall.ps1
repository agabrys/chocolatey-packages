$packageArgs = @{
  packageName   = 'freemake-audio-converter'
  installerType = 'exe'
  silentArgs    = '/VERYSILENT /NORESTART'
  url           = 'http://packages.chocolatey.adam.gabrys.biz/freemake-audio-converter/freemake-audio-converter-1.1.8.6.exe'
  checksum      = '1963b30260c765aa15333a7fae997e7b'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs
