$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.3.1&type=WindowsX64'
  checksum64     = 'db9b7df706d9219ccb80854048c7c64fabf10831fe39c00c7d905fc221649a6f2698bdfd5e69b117af637dd45700f9ec353ac6c4d261905efd0798f6ad79a16f'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
