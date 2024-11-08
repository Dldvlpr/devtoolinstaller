# Check if running as administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Please run this script as Administrator" -ForegroundColor Red
    Exit
}

function Test-PSVersion {
    $version = $PSVersionTable.PSVersion.Major
    if ($version -lt 5) {
        Write-Host "PowerShell 5 or higher is required. Current version: $version" -ForegroundColor Yellow
        Write-Host "Installing latest PowerShell..." -ForegroundColor Cyan

        $downloadUrl = "https://github.com/PowerShell/PowerShell/releases/download/v7.3.4/PowerShell-7.3.4-win-x64.msi"
        $installerPath = "$env:TEMP\PowerShell-7.3.4-win-x64.msi"

        Invoke-WebRequest -Uri $downloadUrl -OutFile $installerPath
        Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$installerPath`" /quiet" -Wait

        Write-Host "PowerShell has been updated. Please restart this script using PowerShell 7" -ForegroundColor Green
        Exit
    }
    return $true
}

function Install-Python {
    try {
        $pythonVersion = python --version 2>&1
        if ($pythonVersion -match "Python 3") {
            Write-Host "Python 3 is already installed: $pythonVersion" -ForegroundColor Green

            Write-Host "Checking for Python updates..." -ForegroundColor Cyan
            python -m pip install --upgrade pip
            return $true
        }
    }
    catch {
        Write-Host "Python 3 is not installed" -ForegroundColor Yellow
        Write-Host "Installing Python 3..." -ForegroundColor Cyan

        if (Get-Command winget -ErrorAction SilentlyContinue) {
            winget install Python.Python.3.11
        }
        else {
            $downloadUrl = "https://www.python.org/ftp/python/3.11.0/python-3.11.0-amd64.exe"
            $installerPath = "$env:TEMP\python-3.11.0-amd64.exe"

            Invoke-WebRequest -Uri $downloadUrl -OutFile $installerPath
            Start-Process -FilePath $installerPath -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1" -Wait
        }

        $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

        Write-Host "Python 3 has been installed" -ForegroundColor Green
        return $true
    }
}

Write-Host "DevToolInstaller - Initial Setup" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan

Test-PSVersion

Install-Python

Write-Host "`nSetup completed successfully!" -ForegroundColor Green
Write-Host "You can now proceed with DevToolInstaller" -ForegroundColor Green