$packageArgs = @{
  packageName   = 'mucommander'
  installerType = 'exe'
  silentArgs    = '/S'
  url           = 'https://github.com/mucommander/mucommander/releases/download/0.9.0/mucommander-0_9_0.exe'
  checksum      = 'e2512f0405169793020d34453e50ad2a'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs
