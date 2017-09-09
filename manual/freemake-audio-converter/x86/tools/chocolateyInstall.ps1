$packageArgs = @{
  packageName   = 'freemake-audio-converter'
  installerType = 'exe'
  silentArgs    = '/VERYSILENT /NORESTART'
  url           = 'http://packages.chocolatey.adam.gabrys.biz/freemake-audio-converter/freemake-audio-converter-1.1.8.11.exe'
  checksum      = '371a928ca92eabd1f47286b4e3fb6a4ba4ca74c6037f2972d89fe4bb1699f5fc8cae7a79e2efb12b23848f2e2d8a5720506de7b42044cbcf034ddd8f78e4947e'
  checksumType  = 'sha512'
}

Install-ChocolateyPackage @packageArgs
