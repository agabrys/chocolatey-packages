$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.8.2&type=WindowsX64'
  checksum64     = '0c968e89d808c373110154ed6aa9160837394eaf34832fe0f80e8b16d868ca75fe0ea9c7eecbe2a8e04fda0f8448188d7812f87d345a3e3eb99af4b16322f4f9'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
