$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.9&type=WindowsX64'
  checksum64     = '4d2a8ecb83c351a485730cc8e0959843c7d9b68daafc1cb9c3b7583058bc4a76581c493564aff7159219b20b9788d5e6adf7bbfc615cb29396ebd53a8da39343'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
