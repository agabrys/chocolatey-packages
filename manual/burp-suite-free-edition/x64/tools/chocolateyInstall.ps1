$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.3.8&type=WindowsX64'
  checksum64     = '1c2d879cf3ed647fbf689c7c361a52459de616322ee9eeb5e3a2e647b19fb8fbba7f02daaef4af4532490f294f2e1b432c527b9343853d10e9fb1cd6cb375e1b'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
