$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.6&type=WindowsX64'
  checksum64     = '747ef571c533f6f649d47869be1c85aa8eb2b1c22f884db6c3ba9d74bfef5809a92ee8d15410dd6218518014a035b2fb8941622c672211404dab5535a83ff9c2'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
