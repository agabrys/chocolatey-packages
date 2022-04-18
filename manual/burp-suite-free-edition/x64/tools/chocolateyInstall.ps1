$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.3.3&type=WindowsX64'
  checksum64     = '0d46d99280d52fe6a632d68024a22efbd3bbbeecb833150de4bba76e3cee1a6da757d28cc7da24b5027f0639fe474973d272c0e283f3938cb8a076913b15ff44'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
