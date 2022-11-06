$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.7&type=WindowsX64'
  checksum64     = 'ba5c0f6b9dbd786e467da77705570d5e48e6c3b3bd226b53d5718fa6949ae1dbb951f685c0ef51eab9079c7c395449cfe83b26cb469a96e322205874c2900d27'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
