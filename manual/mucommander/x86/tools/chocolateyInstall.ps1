$packageArgs = @{
  packageName   = 'mucommander'
  installerType = 'exe'
  silentArgs    = '/S'
  url           = 'https://github.com/mucommander/mucommander/releases/download/0.9.4/mucommander-0.9.4.exe'
  checksum      = 'af5a2bba8a3f7df8e66f7b2b0d656cfe96eef6a885c1d65a3ff672cc6805ce2e5830bd9095e6e1dcbf1a639801ced3db18ef0d8795deaadfa84246ca32c8b877'
  checksumType  = 'sha512'
}

Install-ChocolateyPackage @packageArgs
