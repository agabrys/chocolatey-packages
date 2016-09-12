$packageArgs = @{
  packageName   = 'freemake-video-converter'
  installerType = 'exe'
  silentArgs    = '/VERYSILENT /NORESTART'
  url           = 'http://packages.chocolatey.adam.gabrys.biz/freemake-video-converter/freemake-video-converter-4.1.9.40.exe'
  checksum      = '1c8daf0c700516bd28d05d91a99e099a'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs
