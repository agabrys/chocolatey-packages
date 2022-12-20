$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.12.4&type=WindowsX64'
  checksum64     = '5aeb9d8c9fbedcdda07bbfde5bca55605f751bd98df650aeee0dcaaa6d8692b128ac0ab1602672bc3d313c6b3c7bb13651cf0201896485cff80a6584c790ea67'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
