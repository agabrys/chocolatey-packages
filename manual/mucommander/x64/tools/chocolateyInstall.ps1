$packageArgs = @{
  packageName    = 'mucommander'
  fileType       = 'msi'
  silentArgs     = '/quiet'
  url64          = 'https://github.com/mucommander/mucommander/releases/download/1.4.0-1/mucommander-1.4.0.msi'
  checksum64     = 'bb31dece6730898cd1fc4f1fc81c30927022d294749ee1dab92fd046122a12d10128a6101892d06f9e19027eb3f124c5c3d15e6d1bc9732034742975994c722b'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
