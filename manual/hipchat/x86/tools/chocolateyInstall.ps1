$packageArgs = @{
  packageName   = 'hipchat'
  installerType = 'exe'
  silentArgs    = '/VERYSILENT /NORESTART /NOCLOSEAPPLICATIONS /NORESTARTAPPLICATIONS'
  url           = 'https://hipchat-ops.s3.amazonaws.com/hipchat4/windows/HipChat-4.29.4.1661.exe'
  checksum      = '5f75b0a6663cc84590bf392159928c59'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs
