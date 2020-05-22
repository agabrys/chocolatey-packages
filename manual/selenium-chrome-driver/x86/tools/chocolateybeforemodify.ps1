# Stop any running processes
Get-Process -Name chromedriver -ErrorAction SilentlyContinue | Stop-Process