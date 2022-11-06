$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.8.5&type=WindowsX64'
  checksum64     = '86b358731720bcc27ee026e343d88ba0fa749b071e8bed5afc05d6062e528aa885393d08dac8f65e2c2cee4070e2dcd6c60d5232f908227d4fc62b568db47df0'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
