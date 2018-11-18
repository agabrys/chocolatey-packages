$packageArgs = @{
  packageName   = 'mucommander'
  installerType = 'exe'
  silentArgs    = '/S'
  url           = 'https://github.com/mucommander/mucommander/releases/download/0.9.3/mucommander-0.9.3.exe'
  checksum      = '21bddaf754c7d7a7d8b7e77b2bfb926188bdb94de0fd8e39fef7d98b3036aae5466e0b6b36fa707a39cddc86489690950b5fd03e2a7219195218094ed049c476'
  checksumType  = 'sha512'
}

Install-ChocolateyPackage @packageArgs
