$packageArgs = @{
  packageName    = 'mucommander'
  fileType       = 'msi'
  silentArgs     = '/quiet'
  url64          = 'https://github.com/mucommander/mucommander/releases/download/1.3.0-1/mucommander-1.3.0.msi'
  checksum64     = '8469df6e8b7e0c430568c101b1c63d31219cd5bb3644862384dc7df3ecb6393c52285f741d1a50a4ef927ffe5339af808dd9bf6ecf9c361f7c4f1fa18ef3d0f6'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
