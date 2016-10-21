$packageArgs = @{
  packageName   = 'mucommander'
  installerType = 'exe'
  silentArgs    = '/S'
  url           = 'https://github.com/mucommander/mucommander/releases/download/0.9.1/mucommander-0.9.1.exe'
  checksum      = 'aec9accc65370b345fdd7ee7e46b16bd'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs
