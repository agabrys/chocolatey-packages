$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.11.4&type=WindowsX64'
  checksum64     = '48eff07928ed5e59128a53c49abc1653216bdeb0d4152f880dfcabf14c1f9dab5589b8a19fe7150dfd50c1d778918cb1b0f7a985c00a574f83691caca44959aa'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
