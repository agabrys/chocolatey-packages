$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.5.2&type=WindowsX64'
  checksum64     = '70083d37513c9177e30004d8f0cfa4f7f6ebc036483a885314e2cfa406830ee1339e20175be44fa3c613b02d1eefb728f09b3725518eeefd5643c48b7b687455'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
