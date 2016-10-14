$packageArgs = @{
  packageName   = 'freemake-video-converter'
  installerType = 'exe'
  silentArgs    = '/VERYSILENT /NORESTART'
  url           = 'http://packages.chocolatey.adam.gabrys.biz/freemake-video-converter/freemake-video-converter-4.1.9.42.exe'
  checksum      = 'e535f2e3f7a6b41bc3b350d2edea380a'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs
