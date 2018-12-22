$packageArgs = @{
  packageName   = 'mucommander'
  installerType = 'exe'
  silentArgs    = '/S'
  url           = 'https://github.com/mucommander/mucommander/releases/download/0.9.3-1/mucommander-0.9.3.exe'
  checksum      = '0bc64d58472276a167543616cdc7473cd6d3788165b22d824c9c2aeacc30921871602644711365043538dce7a5cb80fdd77612bd3cfff2c8225eee4f7c6dafbd'
  checksumType  = 'sha512'
}

Install-ChocolateyPackage @packageArgs
