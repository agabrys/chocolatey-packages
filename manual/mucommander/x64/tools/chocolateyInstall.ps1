$packageArgs = @{
  packageName    = 'mucommander'
  fileType       = 'msi'
  silentArgs     = '/quiet'
  url64          = 'https://github.com/mucommander/mucommander/releases/download/1.4.1-1/mucommander-1.4.1.msi'
  checksum64     = 'ebefb7da133a56ad6915f6173e525942f6dd21c3658593a4a6ceee7d1b306201839de4a776fc23bf7f401fa0e184f01ed732f82cd32605a85139f141e0c11d48'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
