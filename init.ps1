#Install Chocolatey
# Set directory for installation - Chocolatey does not lock
# down the directory if not the default
$InstallDir='C:\ProgramData\chocoportable'
$env:ChocolateyInstall="$InstallDir"

# If your PowerShell Execution policy is restrictive, you may
# not be able to get around that. Try setting your session to
# Bypass.
Set-ExecutionPolicy Bypass -Scope Process -Force;

# All install options - offline, proxy, etc at
# https://chocolatey.org/install
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

#Install WSL
wsl --install

#Restart Computer
$input = Read-Host "Restart computer now to Enable WSL [y/n]"
switch($input){
          y{Restart-computer -Force -Confirm:$false}
          n{exit}
    default{write-warning "Invalid Input"}
}