$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.9.6&type=WindowsX64'
  checksum64     = '165f9c855617d2da704998c17b202f2a1a4c0a40a2895afde0a7b7ef03cd66787f8591b13cc99335d0c05423436de291df0acbec761c09a2371697b798374c15'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
