$packageArgs = @{
  packageName   = 'freemake-audio-converter'
  installerType = 'exe'
  silentArgs    = '/VERYSILENT /NORESTART'
  url           = 'http://packages.chocolatey.adam.gabrys.biz/freemake-audio-converter/freemake-audio-converter-1.1.8.12.exe'
  checksum      = '38ee1c376a63389fd535afd1b6a4829e4f874aa29ea550274ead020db1bcf1ad6a61b91abdecda6da4bc694981691087c77123ae74ec6f35687dda9a3b90fe95'
  checksumType  = 'sha512'
}
Install-ChocolateyPackage @packageArgs
