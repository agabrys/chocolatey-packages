$packageArgs = @{
  packageName   = 'freemake-video-converter'
  installerType = 'exe'
  silentArgs    = '/VERYSILENT /NORESTART'
  url           = 'http://agabrys.github.io/chocolatey-packages/freemake-video-converter/freemake-video-converter-4.1.9.45.exe'
  checksum      = 'c0510c60b0e4d3923aa61dda593fec80ee9a829bcb35838733b3b6eab1e671a804ba86413787d8c05884e1895fa7dc616eb498b0aa1b4a1d01af1b76f8f7ef59'
  checksumType  = 'sha512'
}
Install-ChocolateyPackage @packageArgs
