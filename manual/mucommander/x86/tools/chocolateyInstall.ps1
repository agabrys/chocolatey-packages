$packageArgs = @{
  packageName   = 'mucommander'
  installerType = 'exe'
  silentArgs    = '/S'
  url           = 'https://github.com/mucommander/mucommander/releases/download/0.9.6-1/mucommander-0.9.6-1.exe'
  checksum      = '9fa80be3c3b71b1a5329983c9318e84c3a7c2dc08c524116af15f1e7e819faf8bca3b2484c991d2b42d5ef399d26c5d465eb5877d353ab3695654df6a19eac76'
  checksumType  = 'sha512'
}
Install-ChocolateyPackage @packageArgs
