$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tmpDir = "$toolsDir\temp"

$packageArgs = @{
  packageName    = 'selenium-opera-driver'
  url            = 'https://github.com/operasoftware/operachromiumdriver/releases/download/v.2.32/operadriver_win32.zip'
  checksum       = 'd62d5b63efb9f3264cae961df7d3a16128620a72e1affbf421b7cdc6da6e82fa602542a069cb58ab3ccca7255812cc9afb5fc52decd11f0c4d8c0b28a82e6a9c'
  checksumType   = 'sha512'
  url64bit       = 'https://github.com/operasoftware/operachromiumdriver/releases/download/v.2.32/operadriver_win64.zip'
  checksum64     = '8dfea9b067197ad4c5692bf70289c27700d032ee9e4e9f2b6e69f57487499892f25979452c65a5b397eae1caccdc413cd78cfbb7ab46bbc747556f090fc77556'
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

Install-BinFile -Name 'operadriver' -Path $driverPath

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "$menuPrograms\Selenium\Selenium Opera Driver.lnk"
  targetPath       = $driverPath
  iconLocation     = "$toolsDir\icon.ico"
}
Install-ChocolateyShortcut @shortcutArgs
