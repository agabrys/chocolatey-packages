$packageArgs = @{
  packageName   = 'hipchat'
  installerType = 'exe'
  silentArgs    = '/VERYSILENT /NORESTART /NOCLOSEAPPLICATIONS /NORESTARTAPPLICATIONS'
  url           = 'https://hipchat-ops.s3.amazonaws.com/hipchat4/windows/HipChat-4.29.5.1662.exe'
  checksum      = 'e02913c2ec8b679ccacad4d34c75805e'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs
