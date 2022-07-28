#Install WSL
wsl --install

#Restart Computer
$input = Read-Host "Restart computer now to Enable WSL [y/n]"
switch($input){
          y{Restart-computer -Force -Confirm:$false}
          n{exit}
    default{write-warning "Invalid Input"}
}