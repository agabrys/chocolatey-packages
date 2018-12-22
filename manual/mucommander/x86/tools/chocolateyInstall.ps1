$packageArgs = @{
  packageName   = 'mucommander'
  installerType = 'exe'
  silentArgs    = '/S'
  url           = 'https://github.com/mucommander/mucommander/releases/download/0.9.3-2/mucommander-0.9.3.exe'
  checksum      = '59f140c94e920659bfab8430ddbc6b186e3fd202dcab6346fd6327d25cc623ac072b3762fe414331dde719e4f2faec9009efddd2706257f9b446ffae52a71085'
  checksumType  = 'sha512'
}

Install-ChocolateyPackage @packageArgs
