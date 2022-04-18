$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.3.2&type=WindowsX64'
  checksum64     = '72d348089b23eb211156d2ad13b270bed63a20d746b35dbaa213f2da6f47353fe3073a58e7bb980da3e9bb75c64365ef249441226ae5b1e14052652be4015b34'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
