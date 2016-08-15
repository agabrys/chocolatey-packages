$packageArgs = @{
  packageName   = 'freemake-video-converter'
  installerType = 'exe'
  silentArgs    = '/VERYSILENT /NORESTART'
  url           = 'http://packages.chocolatey.adam.gabrys.biz/freemake-video-converter/freemake-video-converter-4.1.9.31.exe'
  checksum      = '219dc1d9aeb09d4886308cc5779b7c10'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs
