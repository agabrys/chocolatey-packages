$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.12.3&type=WindowsX64'
  checksum64     = '359fc91735d4d3bbd799755f027dbbe6326e9944ca2b42e0777ebdafd21d4da29040cf3ca36e257356e31b4476e1ebec02109b056de688d8c4c8f0e28a7fee2f'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
