$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.12.2&type=WindowsX64'
  checksum64     = '8b24051a052c886f0d197f8233f8e050f1d4b425af6c1df2aa0691d85d3783c7c14bcafa6eb5b63b7e72797bc57b7db5818f50d1efc20c08385630a72f5b302a'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
