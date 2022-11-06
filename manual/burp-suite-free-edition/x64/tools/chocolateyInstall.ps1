$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.7.1&type=WindowsX64'
  checksum64     = '428815b4c8f76fbc85bfd48474581112b7ae60d7b3ec37f50d8fec9de6c91fbabac92fa5c5e2900c1de6857cc53168d7391e5a243f9140e6ec3527d08d416865'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
