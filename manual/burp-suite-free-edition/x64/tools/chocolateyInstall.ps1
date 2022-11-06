$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.8.1&type=WindowsX64'
  checksum64     = '0d5a3d212be8f581ef9d074c70c35c4ba9f93e742df21c9368aecc92551f7289347de4c60c87fe041b7d32a00af1218f2def89252417e5f2a3a8b8e2bcec7e74'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
