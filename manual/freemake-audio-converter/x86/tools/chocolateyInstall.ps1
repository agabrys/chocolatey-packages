$packageArgs = @{
  packageName   = 'freemake-audio-converter'
  installerType = 'exe'
  silentArgs    = '/VERYSILENT /NORESTART'
  url           = 'http://packages.chocolatey.adam.gabrys.biz/freemake-audio-converter/freemake-audio-converter-1.1.8.4.exe'
  checksum      = 'fa9dd7ab5a03ebd14324d72f128e1585'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs
