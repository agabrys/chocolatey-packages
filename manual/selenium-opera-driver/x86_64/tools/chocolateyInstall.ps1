$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tmpDir = "$toolsDir\temp"

$parameters = Get-PackageParameters

$packageArgs = @{
  packageName    = 'selenium-opera-driver'
  url            = 'https://github.com/operasoftware/operachromiumdriver/releases/download/v.75.0.3770.100/operadriver_win32.zip'
  checksum       = '5165c0474d144be627cad2f1e05022e85bb0bf3c902198318f5a25214dc70a4ab8b7b55702014d6d59a83da8fdac2df64857cac02d9589c449e3a97927972101'
  checksumType   = 'sha512'
  url64bit       = 'https://github.com/operasoftware/operachromiumdriver/releases/download/v.75.0.3770.100/operadriver_win64.zip'
  checksum64     = '4ce958c38feda3f4f6d74060b76f4dc248c32143e3665c14cda2b7ee11ac02803a91f6468921dc5fd523bb7d4445002e8a1294cd007df90bea8a5478b124a8f9'
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
