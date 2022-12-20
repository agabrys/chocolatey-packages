$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.12.1&type=WindowsX64'
  checksum64     = 'b4a8e8dd846c6dc2f3f72ebe07007572a02f835ceb55d41eb0eb90b0c2c8b3b86214b2e391e000ed53c7eaec8e79ef3ee043b06800653823a59b526a68f4d007'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
