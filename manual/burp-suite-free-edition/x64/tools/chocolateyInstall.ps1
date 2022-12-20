$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.11.1&type=WindowsX64'
  checksum64     = 'c17bf87b9c770db7e57f7379f78e9025427a39447f484e04595ee5bf02c84def394b2fd7e6b3248d2cb4bbc7507c5027e3f5d827ae4ccd1808cbf1521d43e216'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
