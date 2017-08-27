$packageArgs = @{
  packageName   = 'hipchat'
  installerType = 'exe'
  silentArgs    = '/VERYSILENT /NORESTART /NOCLOSEAPPLICATIONS /NORESTARTAPPLICATIONS'
  url           = 'https://atlassian.jfrog.io/atlassian/libqt-hipchat/HipChat-4.30.1.1663.exe'
  checksum      = '2a961f3fa95408f806efb0c50114afea910b53cd5ddac0fb37c56aae1cf8750316896c50295bce14348e46aada136c7fea819c8cdc184059847b448448a9bbdd'
  checksumType  = 'sha512'
}

Install-ChocolateyPackage @packageArgs
