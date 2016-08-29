$packageArgs = @{
  packageName   = 'hipchat4'
  installerType = 'exe'
  silentArgs    = '/VERYSILENT /NORESTART /NOCLOSEAPPLICATIONS /NORESTARTAPPLICATIONS'
  url           = 'https://hipchat-ops.s3.amazonaws.com/hipchat4/windows/HipChat-4.26.5.1655.exe'
  checksum      = 'a288739d2d3b5e39d1ecfe777a2caf4c'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs
