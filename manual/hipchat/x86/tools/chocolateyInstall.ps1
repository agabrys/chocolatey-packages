$packageArgs = @{
  packageName   = 'hipchat'
  installerType = 'exe'
  silentArgs    = '/VERYSILENT /NORESTART /NOCLOSEAPPLICATIONS /NORESTARTAPPLICATIONS'
  url           = 'https://hipchat-ops.s3.amazonaws.com/hipchat4/windows/HipChat-4.27.1.1658.exe'
  checksum      = '7750cdaefeb976c4d48a294a0528e4aa'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs
