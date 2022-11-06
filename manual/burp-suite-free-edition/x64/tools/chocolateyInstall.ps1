$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.9.1&type=WindowsX64'
  checksum64     = 'ec236808707bb696a473d689da5844dd352e3e562450cce7014e93356e4e05c357c2ac9c21b01c3eda07f982bb4ad2e29d29fc126fbd3338b4979bf6697a9d7c'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
