$packageArgs = @{
  packageName   = 'mucommander'
  installerType = 'exe'
  silentArgs    = '/S'
  url           = 'https://github.com/mucommander/mucommander/releases/download/0.9.3-3/mucommander-0.9.3.exe'
  checksum      = 'be0b5529d0fac5ed1322982eca2a4d0ac2413fc21729b22ac009fb4e470d78bcb7ba9a32bfb0cfe9dfcb10d7ac8832aeaf0de114915e3301a0441e91e2017e48'
  checksumType  = 'sha512'
}

Install-ChocolateyPackage @packageArgs
