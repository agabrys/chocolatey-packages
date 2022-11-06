$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.8.3&type=WindowsX64'
  checksum64     = 'd6d6b9773bbbe112bb698fb6596393c92ddb39d0e9f2a9857a21dc22741fa932e8f5ba6f819fd631eef0e5e7a932ab212315c0b2d0e930484ae5b5970934fc8f'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
