$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tmpDir = "$toolsDir\temp"

$packageArgs = @{
  packageName   = 'selenium-ie-driver'
  url           = 'http://selenium-release.storage.googleapis.com/2.53/IEDriverServer_Win32_2.53.0.zip'
  checksum      = '63066830741d59ae6c74045a9f24291c'
  checksumType  = 'md5'
  url64bit       = 'http://selenium-release.storage.googleapis.com/2.53/IEDriverServer_x64_2.53.0.zip'
  checksum64     = '0acce304cbd05a25ba6f11f7c8b9311c'
  checksumType64 = 'md5'
  unzipLocation  = $tmpDir	
}

Install-ChocolateyZipPackage @packageArgs
New-Item $toolsDir\bin -ItemType directory
Move-Item $tmpDir\IEDriverServer.exe $toolsDir\bin\driver.exe -Force
Remove-Item $tmpDir -Recurse -Force
