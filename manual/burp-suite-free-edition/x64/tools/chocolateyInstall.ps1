$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.9.2&type=WindowsX64'
  checksum64     = 'ed1fd45aad5a3398231a98832af6133acc0bd377a8a2aa2f26129f02b13f4b81ddea398df355de3b5892a8b1c3ba214b461e0f8f3845912ea02228fa770872ec'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
