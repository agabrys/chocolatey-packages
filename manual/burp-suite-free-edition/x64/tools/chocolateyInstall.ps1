$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.9.4&type=WindowsX64'
  checksum64     = 'fad87f7f24101eba9c4bc50986dd0e029e9e39dd8ac9be6c5991f6c26bdd378771bc7379f6d67cbcb94fa1d48230c8613aaa01c697d7fa88c3da5d37a35ec76c'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
