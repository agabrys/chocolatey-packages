$packageArgs = @{
  packageName    = 'mucommander'
  fileType       = 'msi'
  silentArgs     = '/quiet'
  url64          = 'https://github.com/mucommander/mucommander/releases/download/1.1.0-1/muCommander-1.1.0-1.msi'
  checksum64     = '523eac36dc14c4eabad64e8f95cb9675fa635084914e5033b3113f3aa257f653f2ea6da3fd60ed98820458ea20614de8ebf473e2078086d74bff21ba067e5977'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
