$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.3&type=WindowsX64'
  checksum64     = '6658aef906a7b1143c2a2a162f7a10594d8d1a6ce11d627239875fce5437b2c0e20154fba57af73a72430c3224d67cfa1f8fedf57f28a83868a16951bb589156'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
