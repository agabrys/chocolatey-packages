$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tmpDir = "$toolsDir\temp"

$packageArgs = @{
  packageName    = 'selenium-opera-driver'
  url            = 'https://github.com/operasoftware/operachromiumdriver/releases/download/v.2.30/operadriver_win32.zip'
  checksum       = 'f66f89eece449b9588fdc774d3a05890c94a60edd4ba642c542f358782b75b97723dd06140f385f56789ddff25d9ba1b25173db057b0d573d45c6b82a9d90cc2'
  checksumType   = 'sha512'
  url64bit       = 'https://github.com/operasoftware/operachromiumdriver/releases/download/v.2.30/operadriver_win64.zip'
  checksum64     = '9ef909e26fa1c2880710a59aa076c1b546e42675861146a3857d79e8e88754abb6c733d8e1fd59016967806489c277f1237e13eeb8dfcca33c06376d688dde8b'
  checksumType64 = 'sha512'
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
