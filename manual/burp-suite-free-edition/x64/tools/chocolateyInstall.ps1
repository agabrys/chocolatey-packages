$packageArgs = @{
  packageName    = 'burp-suite-free-edition'
  fileType       = 'exe'
  silentArgs     = '-q'
  url64bit       = 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.3.6&type=WindowsX64'
  checksum64     = 'df27864ba0df51a89a48d5971acf021179136855f3bb1de6be89c9bb3577f89926095862e5435db3849d471330061ef23845793742b2149239cec0eb28fc04ff'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
