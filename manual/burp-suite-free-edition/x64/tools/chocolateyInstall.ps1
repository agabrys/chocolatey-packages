$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.6.1&type=WindowsX64'
  checksum64     = '270ddff4bee45d06ee9975cf7211e7c358cd6a2c5a4ca4791b9c7db023e1e351fd37e883eabc0ca4c51d362305995e695d21fa6fec72c3c0dc95274eec8c1a4c'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
