$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tmpDir = "$toolsDir\temp"

$parameters = Get-PackageParameters

$packageArgs = @{
  packageName    = 'selenium-opera-driver'
  url            = 'https://github.com/operasoftware/operachromiumdriver/releases/download/v.2.37/operadriver_win32.zip'
  checksum       = '9b31fa2c2f5bce38a226c332130f031920615dd03c66231e0f4dbc4fdb40f2cff5c7c055484f922e8ff5c1ce5c6f4892a0ed2c2519715970fb8872a6cdf039e4'
  checksumType   = 'sha512'
  url64bit       = 'https://github.com/operasoftware/operachromiumdriver/releases/download/v.2.37/operadriver_win64.zip'
  checksum64     = 'faf6cbf4a00fdada43b93c8b44ef2a09ec0a7cd70fecdd5504a0c95fdb1b522f72cec0fc2675a0499a4d276bc84539c331ea4be37ff10d65de3c6c0d4ae62ae6'
  checksumType64 = 'sha512'
  unzipLocation  = $tmpDir
}
Install-ChocolateyZipPackage @packageArgs

$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\operadriver.exe"

If (!(Test-Path -Path $seleniumDir)) {
  New-Item -Path $seleniumDir -ItemType directory
}

If (Get-ProcessorBits 64) {
    If ($env:chocolateyForceX86) {
        $bits = 32
    } Else {
        $bits = 64
    }
} Else {
    If ($env:chocolateyForceX64) {
        $bits = 64
    } Else {
        $bits = 32
    }
}

Move-Item -Path $tmpDir\operadriver_win$bits\operadriver.exe -Destination $driverPath -Force
Write-Host -ForegroundColor Green Moved driver to $seleniumDir
Remove-Item -Path $tmpDir -Recurse -Force

Uninstall-BinFile -Name 'operadriver'
If ($parameters['SkipShim'] -ne 'true') {
  Install-BinFile -Name 'operadriver' -Path $driverPath
}

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "$menuPrograms\Selenium\Selenium Opera Driver.lnk"
  targetPath       = $driverPath
  iconLocation     = "$toolsDir\icon.ico"
}
Install-ChocolateyShortcut @shortcutArgs
