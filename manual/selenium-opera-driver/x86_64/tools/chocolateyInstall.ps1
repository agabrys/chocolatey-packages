$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tmpDir = "$toolsDir\temp"

$parameters = Get-PackageParameters

$packageArgs = @{
  packageName    = 'selenium-opera-driver'
  url            = 'https://github.com/operasoftware/operachromiumdriver/releases/download/v.2.42/operadriver_win32.zip'
  checksum       = 'fa9c9658372efa9bc868204423c0c8baa9893c64cb6da9c0ca403d90f74405702bbd18786a17512eb789553f9263de998eba237372ddf8a1c541959b933e1e8d'
  checksumType   = 'sha512'
  url64bit       = 'https://github.com/operasoftware/operachromiumdriver/releases/download/v.2.42/operadriver_win64.zip'
  checksum64     = '6ddb0ba93557d6f8ec0a9292a5e601cb7bf56782a8102a0a482e7bbdca12ce989c0dd0935511d3c095fbf8abd4137b7abd9404adf8e9357608b314af7b05e0bb'
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
