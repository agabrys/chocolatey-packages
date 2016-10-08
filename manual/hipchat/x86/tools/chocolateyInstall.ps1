$packageArgs = @{
  packageName   = 'hipchat'
  installerType = 'exe'
  silentArgs    = '/VERYSILENT /NORESTART /NOCLOSEAPPLICATIONS /NORESTARTAPPLICATIONS'
  url           = 'https://hipchat-ops.s3.amazonaws.com/hipchat4/windows/HipChat-4.28.1.1659.exe'
  checksum      = '93468618845c2e7eebc143eaa9d16d9f'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs
