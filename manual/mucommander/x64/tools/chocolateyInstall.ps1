$packageArgs = @{
  packageName    = 'mucommander'
  fileType       = 'msi'
  silentArgs     = '/quiet'
  url64          = 'https://github.com/mucommander/mucommander/releases/download/1.5.1-1/mucommander-1.5.1.msi'
  checksum64     = '2c54d99be0c7857f59fe9f340f15b51fe30330695273e1d7b6321125aac6e9683129355693d78c4f8e5f516ac9046a8d05d778dbd1ad6e33a70f70e88ddb9d15'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
