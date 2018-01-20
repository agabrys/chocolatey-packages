$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tmpDir = "$toolsDir\temp"

$packageArgs = @{
  packageName    = 'selenium-opera-driver'
  url            = 'https://github.com/operasoftware/operachromiumdriver/releases/download/v.2.33/operadriver_win32.zip'
  checksum       = 'a2eb5572d9413845fa25732f508a8cc1604cacd1b295c512099a53eea2d0b7433b1511cf85ddf93794fd9a0673d2db01484e7af94b469a028772145159632d48'
  checksumType   = 'sha512'
  url64bit       = 'https://github.com/operasoftware/operachromiumdriver/releases/download/v.2.33/operadriver_win64.zip'
  checksum64     = '833524277c0fc3fada4b116f6077eacfea76a067c6062109c2ca17982009916eda748b8eb29a6b612d0f020908e4b5cd7ad9e185b2fc576c7f200eb43f5dded7'
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
