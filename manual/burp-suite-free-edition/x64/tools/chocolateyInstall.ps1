$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.11.2&type=WindowsX64'
  checksum64     = 'a2c6a113b051626cf114528f9b34b7977121b383e8b67cabeac7605ceeef1c60133755f98dd9e36860892a82af968719f1c71b47b8ff29548c67a11435235347'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
