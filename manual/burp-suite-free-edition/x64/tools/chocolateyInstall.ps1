$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.8&type=WindowsX64'
  checksum64     = '041fcc4a45f6f5ea209eb8d7bf7a64b35229d0776148bf672071155fe89df05b59db2fff463d601c6f1076eb7dbb25b8bf1b5a99cae87371224d98f023e6a42c'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
