$readFile = Get-Content "h:\documents\office 365\Remove-MsolUser.csv"
  
foreach($user in $readFile){
    Remove-MsolUser –UserPrincipalName $user -force
}