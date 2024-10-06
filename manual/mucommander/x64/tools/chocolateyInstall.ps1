$packageArgs = @{
  packageName    = 'mucommander'
  fileType       = 'msi'
  silentArgs     = '/quiet'
  url64          = 'https://github.com/mucommander/mucommander/releases/download/1.2.0-1/muCommander-1.2.0.msi'
  checksum64     = '07f7cece2a3ab7c79fd7c9f2345e6e6cb83ab5a3690ba5580f2e77fad3338dc87edfe32304037ab7fc228068ea3e466451b7db03c0c401b661621b5290c6d7d1'
  checksumType64 = 'sha512'
}
Install-ChocolateyPackage @packageArgs
