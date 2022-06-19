$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.3.7&type=WindowsX64'
  checksum64     = '0a27f4e75212536fc5fce7b1761926fcc950b32acaa8372a95c53f477f5e565d55f8190ab021ee77d8f7df0b545413491b564dbf78dd3feaf295dfce421228fc'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
