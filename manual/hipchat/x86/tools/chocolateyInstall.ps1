$packageArgs = @{
  packageName   = 'hipchat'
  installerType = 'exe'
  silentArgs    = '/VERYSILENT /NORESTART /NOCLOSEAPPLICATIONS /NORESTARTAPPLICATIONS'
  url           = 'https://atlassian.jfrog.io/atlassian/libqt-hipchat/HipChat-4.30.3.1665.exe'
  checksum      = '3eb3598fe068f96864a2bb3e2b857a6984d721af2e52848ddd8d733a59963ac71deab1ac59f53815bff6b2b1e27126d45ef5edca6e07efca078477d7b0f0ffe1'
  checksumType  = 'sha512'
}
Install-ChocolateyPackage @packageArgs
