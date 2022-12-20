$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.11.3&type=WindowsX64'
  checksum64     = '584c27aac508709ec621fe839aec0efc1b9c0a167158eb56ef659ba883bff91280c140505328fdf8a9d04b18c5b65b82ce3bd7a6a1eefd23056cd1eb831d6e45'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
