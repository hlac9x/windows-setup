# Automated Windows workstation set up

## Features

- Install Windows Subsystem Linux
- Install Homebrew
- Install CLI and GUI packages

## Updating
- Change system settings
- Install dotfiles and some macOS specific configuration files

## Usage

Download this repository

Open powershell with run as administrator

```sh
PS C:\> Set-ExecutionPolicy unrestricted
PS C:\> .\wsl.ps1
```

Wait for the WSL installation complete after restart


Open terminal with Ubuntu (WSL)

and Run the playbook
```sh
./wsl.sh
make [function]
```