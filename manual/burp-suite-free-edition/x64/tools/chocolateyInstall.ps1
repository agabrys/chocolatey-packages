$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.2.5&type=WindowsX64'
  checksum64     = 'bec0e794e5cc20f3ad07dd08b446d856431ae664e784ce4a46f52e0ac7b4d2e798af6d2a79340733d9c6b695e776276c42609c9ea007aa366a4909f49d8c1b2f'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
