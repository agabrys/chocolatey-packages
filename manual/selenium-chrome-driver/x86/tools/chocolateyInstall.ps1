$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tmpDir = "$toolsDir\temp"

$packageArgs = @{
  packageName   = 'selenium-chrome-driver'
  url           = 'https://chromedriver.storage.googleapis.com/2.31/chromedriver_win32.zip'
  checksum      = '14cd13362758351d18da3872403e1d79bf7a17fa598c977849c13a66528201e4389c472d3364d74e2a04954f89dab05eeeaf19c8184579896483ab5650cd785e'
  checksumType  = 'sha512'
  unzipLocation = $tmpDir
}

Install-ChocolateyZipPackage @packageArgs

$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"
$driverPath = "$seleniumDir\chromedriver.exe"

If (!(Test-Path $seleniumDir)) {
  New-Item $seleniumDir -ItemType directory
}
Move-Item $tmpDir\chromedriver.exe $driverPath -Force
Write-Host -ForegroundColor Green Moved driver to $seleniumDir
Remove-Item $tmpDir -Recurse -Force

$oldDriverPath = "$seleniumDir\chrome-driver.exe"
If (Test-Path $oldDriverPath) {
  Remove-Item $oldDriverPath -Force
}

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "$menuPrograms\Selenium\Selenium Chrome Driver.lnk"
  targetPath       = $driverPath
  iconLocation     = "$toolsDir\icon.ico"
}

Install-ChocolateyShortcut @shortcutArgs
