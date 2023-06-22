# Check if the current user has administrative privileges
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
if (-not $isAdmin) {
    $scriptPath = [System.Diagnostics.Process]::GetCurrentProcess().MainModule.FileName
    # Relaunch the script with administrative privileges
    Start-Process -FilePath $scriptPath -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"" -Verb RunAs
    exit
}

# Check if WSL is installed
$wslFeature = Get-WindowsOptionalFeature -FeatureName Microsoft-Windows-Subsystem-Linux -Online -ErrorAction SilentlyContinue

if ($wslFeature -eq $null) {
    # WSL feature not installed, enable it
    $enableResult = Enable-WindowsOptionalFeature -FeatureName Microsoft-Windows-Subsystem-Linux -Online
    # Check if a restart is needed
    if ($enableResult.RestartNeeded) {
        Write-Output "WSL feature has been enabled. Please restart your computer for the changes to take effect."
        exit
    }
    else {
        Write-Output "WSL feature has been enabled. Updating to wsl version 2."
        wsl --set-default-version 2
    }
}
else {
    Write-Output "WSL is already installed. Updating to wsl version 2."
    wsl --set-default-version 2
}

# get the alpine linux from outside microsoft store

if (-Not (Test-Path "Alpine.zip")) {
    irm "https://github.com/phanirithvij/ansible-wininit/releases/download/v0.0.1-alpha/Alpine.zip" -OutFile Alpine.zip
    Expand-Archive Alpine.zip
    if (-Not (Test-Path "Alpine.exe")) {
        mv Alpine\Alpine.exe .
    }
    if (-Not (Test-Path "rootfs.tar.gz")) {
        mv Alpine\rootfs.tar.gz .
    }
}
if (Test-Path "Alpine") {
    rm -Recurse -Force "Alpine\*"
    rm -Recurse -Force Alpine
}

$error.clear()
try {
    .\Alpine.exe run "./scripts/info.sh"
}
catch {	"Error occured" }
if (!$error) {
    # https://github.com/yuk7/wsldl/issues/51#issuecomment-994825989
    echo y | .\Alpine.exe | Out-Null
    .\Alpine.exe run "./scripts/info.sh"
    .\Alpine.exe run "./scripts/init.sh"
    . .\scripts\copy_keys.ps1
}
