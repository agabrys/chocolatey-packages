$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.9.5&type=WindowsX64'
  checksum64     = '9012fa6fadac1bdca6503960082322c61192b9a1233230ce8db947b68253ce11acb840fb71b3269e5a558b2dca91e4afc2cc51161fc4a4f25174c1697c93af88'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
