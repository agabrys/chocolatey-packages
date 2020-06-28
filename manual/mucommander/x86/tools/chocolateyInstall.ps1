$packageArgs = @{
  packageName   = 'mucommander'
  installerType = 'exe'
  silentArgs    = '/S'
  url           = 'https://github.com/mucommander/mucommander/releases/download/0.9.5-1/mucommander-0.9.5-1.exe'
  checksum      = 'c48dcae33e469c77f833ef9659f815222deb75b249870634497457bf8da9117047a8af9ff5a0c96660054b67e128504150601a39b64fa30d9401b9eb9846dc81'
  checksumType  = 'sha512'
}

Install-ChocolateyPackage @packageArgs
