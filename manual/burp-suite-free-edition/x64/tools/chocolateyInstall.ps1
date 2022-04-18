$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.3.4&type=WindowsX64'
  checksum64     = '09ed28aafcefc92cd0733e99735743f67ffa0b564a89949f90dd1825c9366ee9142e3702a3edcc783eaf2f7be55dc0f7b17f9113350a70eab96d89c61ba45190'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
