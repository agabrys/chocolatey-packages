$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.3.5&type=WindowsX64'
  checksum64     = 'b9d2f0135de7592dbd1f68ad5059d13bc536adad7cf057f9634202bb99546b670562a4f9efa69038b191500daa2da2910bb9937afa4bd1899d9fc4f59f0031e9'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
