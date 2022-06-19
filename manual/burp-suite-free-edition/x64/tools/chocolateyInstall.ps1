$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.3.9&type=WindowsX64'
  checksum64     = '1afe1a801857158841be5b13bd716bcec55afedf06f8af6c0416442ac85b4ce7d11a1bcabc77d2e6208c50526fccbe9ec18e768faeca174f4e8191ba9a93f262'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
