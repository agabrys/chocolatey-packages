$packageArgs = @{
  packageName    = 'mucommander'
  fileType       = 'msi'
  silentArgs     = '/quiet'
  url64          = 'https://github.com/mucommander/mucommander/releases/download/1.5.0-1/mucommander-1.5.0.msi'
  checksum64     = '69f7e2d8c6e8668b0972cd29da3d88100c768c3f92ca25a27e838e88acfb77dbd64bf38977ac7549e977adf36bf85478a58ef7220267735eadffacd659e94c9c'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
