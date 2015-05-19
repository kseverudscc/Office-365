Import-Module MSOnline
$msolcred = get-credential
Connect-MSOLService -credential:$msolcred

Remove-MsolUser -UserPrincipalName bbunny@shoreline.edu -force 
Remove-MsolUser -UserPrincipalName bbunny@shoreline.edu -force –RemoveFromRecycleBin

Get-Recipient 1b2eaa95-0d64-4469-9fb2-d8f9be3e28ce