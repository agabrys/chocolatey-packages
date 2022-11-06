$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.9.3&type=WindowsX64'
  checksum64     = 'cb3223a2f1d81fe09586075d664bffe49ae6d52be84b02992703a1b80c005af8590a7e8b345bcf5a67e15aae64b22942e8a902533ba693af51d8be8f2f1ee7fd'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
