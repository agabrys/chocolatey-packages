$packageArgs = @{
  packageName   = 'mucommander'
  installerType = 'exe'
  silentArgs    = '/S'
  url           = 'https://github.com/mucommander/mucommander/releases/download/0.9.7-1/mucommander-0.9.7-1.exe'
  checksum      = '8f159e5f3e23ea6305825303eb55538e39c9208d4a964ab3f191400549b7fb2fa49b2dddb974c1d8ef239fa2e15f11e1feae98902fa901fa212dd3aab7d83b83'
  checksumType  = 'sha512'
}
Install-ChocolateyPackage @packageArgs
