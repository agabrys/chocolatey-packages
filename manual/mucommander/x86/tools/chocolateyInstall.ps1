$packageArgs = @{
  packageName   = 'mucommander'
  installerType = 'exe'
  silentArgs    = '/S'
  url           = 'https://github.com/mucommander/mucommander/releases/download/0.9.2/mucommander-0.9.2.exe'
  checksum      = 'f97da035364833035a27f1feb13b45a5'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs
