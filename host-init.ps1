#Upgrading PowerShell and .NET Framework
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$url = "https://raw.githubusercontent.com/jborean93/ansible-windows/master/scripts/Upgrade-PowerShell.ps1"
$file = "$env:temp\Upgrade-PowerShell.ps1"
$username = "cloud_user"
$password = "P@ssword1234"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force

# Version can be 3.0, 4.0 or 5.1
&$file -Version 5.1 -Username $username -Password $password -Verbose

#WinRM Memory Hotfix
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$url = "https://raw.githubusercontent.com/jborean93/ansible-windows/master/scripts/Install-WMF3Hotfix.ps1"
$file = "$env:temp\Install-WMF3Hotfix.ps1"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
powershell.exe -ExecutionPolicy ByPass -File $file -Verbose

#
winrm quickconfig -force

#
python -m pip install --upgrade pip
pip install pywinrm

# #Install WSL
# wsl --install

# #Restart Computer
# $input = Read-Host "Restart computer now to Enable WSL [y/n]"
# switch($input){
#           y{Restart-computer -Force -Confirm:$false}
#           n{exit}
#     default{write-warning "Invalid Input"}
# }