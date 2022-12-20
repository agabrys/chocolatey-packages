$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.12&type=WindowsX64'
  checksum64     = 'be4cdf366ba38ee6709a12758501bd4e3a1e56ec9d81bff8bd67f0820ffbb73b67e057068092f002005f8af991f6b23025d580d98ed8b1489dd49843eef8a274'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
