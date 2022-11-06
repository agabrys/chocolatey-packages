$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.8.4&type=WindowsX64'
  checksum64     = 'd09dac7bfd2ae42c1ffbfb883d5cced53cd8cd40ac18ffae42312c90e13da2fca6af8a5eec67efa58b1bb628d4eb1e18c7d71aeed08a90cabb9e2a082a6e9bf3'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
