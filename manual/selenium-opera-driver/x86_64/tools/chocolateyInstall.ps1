$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tmpDir = "$toolsDir\temp"

$packageArgs = @{
  packageName    = 'selenium-opera-driver'
  url            = 'https://github.com/operasoftware/operachromiumdriver/releases/download/v.2.29/operadriver_win32.zip'
  checksum       = 'df632f4be84b492782b0c6d710566b94d1e489a729abe9e27bee42f6ea3d7a61'
  checksumType   = 'sha256'
  url64bit       = 'https://github.com/operasoftware/operachromiumdriver/releases/download/v.2.29/operadriver_win64.zip'
  checksum64     = 'aeb6c215f3e157e8f60d964e7ce8059cc835b71882d216e3e8e56d4a147e5853'
  checksumType64 = 'sha256'
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
