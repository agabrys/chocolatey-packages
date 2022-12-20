$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.11&type=WindowsX64'
  checksum64     = 'c595d233cb0c149a9907212e57306451c747b05a69bf8d9f2d1a77009830fd406857fd3fb2b39dced1bff2ba0fcdefbf576cc72d82ead7ca807fecd95dea9d02'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
