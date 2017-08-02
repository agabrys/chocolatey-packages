$packageArgs = @{
  packageName   = 'freemake-audio-converter'
  installerType = 'exe'
  silentArgs    = '/VERYSILENT /NORESTART'
  url           = 'http://packages.chocolatey.adam.gabrys.biz/freemake-audio-converter/freemake-audio-converter-1.1.8.10.exe'
  checksum      = '948a0219081ece52000d178d68bb5bce98b3608edd8e15db4fa893a3f7383b7250918c9c631942955870e4161edd64ff59831cf74caa049b1bb7d8f7cef16752'
  checksumType  = 'sha512'
}

Install-ChocolateyPackage @packageArgs
