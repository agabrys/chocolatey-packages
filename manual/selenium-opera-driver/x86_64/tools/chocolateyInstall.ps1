$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tmpDir = "$toolsDir\temp"

$packageArgs = @{
  packageName    = 'selenium-opera-driver'
  url            = 'https://github.com/operasoftware/operachromiumdriver/releases/download/v.2.27/operadriver_win32.zip'
  checksum       = '55c0ef373385766a49828a653a170edc'
  checksumType   = 'md5'
  url64bit       = 'https://github.com/operasoftware/operachromiumdriver/releases/download/v.2.27/operadriver_win64.zip'
  checksum64     = '7c5002d6c0062c16f51116242dd8861f'
  checksumType64 = 'md5'
  unzipLocation  = $tmpDir
}

Install-ChocolateyZipPackage @packageArgs

$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\operadriver.exe"

If (!(Test-Path $seleniumDir)) {
  New-Item $seleniumDir -ItemType directory
}

if (Get-ProcessorBits 64) {
    if ($env:chocolateyForceX86) {
        $bits = 32
    } else {
        $bits = 64
    }
} else {
    if ($env:chocolateyForceX64) {
        $bits = 64
    } else {
        $bits = 32
    }
}

Move-Item $tmpDir\operadriver_win$bits\operadriver.exe $driverPath -Force
Write-Host -ForegroundColor Green Moved driver to $seleniumDir
Remove-Item $tmpDir -Recurse -Force

$oldDriverPath = "$seleniumDir\opera-driver.exe"
If (Test-Path $oldDriverPath) {
  Remove-Item $oldDriverPath -Force
}

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "$menuPrograms\Selenium\Selenium Opera Driver.lnk"
  targetPath       = $driverPath
  iconLocation     = "$toolsDir\icon.ico"
}

Install-ChocolateyShortcut @shortcutArgs
