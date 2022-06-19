$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.5&type=WindowsX64'
  checksum64     = 'be24abd277672f740ac5f863f5d30c9473ae4a4f587a50725578c371569c9a1f27ead8576cbf34662f0a4d63c14a579184c4be8a6e2180c2cee68d504a63b2d2'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
