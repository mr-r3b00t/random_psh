#remotely force a group policy update on the fly via winRM
#mrR3b00t

$computers = Get-ADComputer -Filter {operatingSystemVersion -like "*"}

ForEach($computer in $computers){

write-host "Testing :" $computer.name " for WinRM" -ForegroundColor Cyan
Test-WSMan -ComputerName $computer.name -Authentication Default
Invoke-Command -ComputerName $computer.Name {gpupdate /force}
}
