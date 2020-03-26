$packageArgs = @{
  packageName   = 'mucommander'
  installerType = 'exe'
  silentArgs    = '/S'
  url           = 'https://github.com/mucommander/mucommander/releases/download/0.9.4-2/mucommander-0.9.4-2.exe'
  checksum      = '66e7404f19f4b45cf7fb1c9833feb3a3c5666c1f46efbfc42913fcb301516e203511a37efe3cf483a910e27d3b8c31f177e4eb04550636f3fbe0b3ecfc114c58'
  checksumType  = 'sha512'
}

Install-ChocolateyPackage @packageArgs
