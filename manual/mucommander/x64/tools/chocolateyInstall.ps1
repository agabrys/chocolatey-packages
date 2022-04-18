$packageArgs = @{
  packageName    = 'mucommander'
  fileType       = 'msi'
  silentArgs     = '/quiet'
  url64          = 'https://github.com/mucommander/mucommander/releases/download/1.0.0-1/muCommander-1.0.0-1.msi'
  checksum64     = 'ab397f017f2d32b5c00f194528c0aa273defd59732c8565a180cfc6a03f74a80d3f44aa22f6a83e627b36c23ac049f52442b9c0e4306de597d4a4c8c4af3530a'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
