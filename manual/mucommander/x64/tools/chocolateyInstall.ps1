$packageArgs = @{
  packageName    = 'mucommander'
  fileType       = 'msi'
  silentArgs     = '/quiet'
  url64          = 'https://github.com/mucommander/mucommander/releases/download/1.0.1-1/muCommander-1.0.1-1.msi'
  checksum64     = '98147bcbf453a55497b2bad77696fee4310a9efddd5e611b6a15ddb739761b3b65a0b05ae577a0a93152129588a0800cb88bdd0c7886f60499e258e47d2d5922'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
