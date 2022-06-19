$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.5.1&type=WindowsX64'
  checksum64     = 'f0007bea8ee248cb7e679baca6a0f4a4ddc9324e5387274b0c02b5ad1c88b28f8c200c3586e021926f8e682a57f95915785b0829681e00ab798292bce78718bc'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
