$FixAutoMapping = Get-MailboxPermission sccadmis@shoreline.edu |where {$_.AccessRights -eq "FullAccess" -and $_.IsInherited -eq $false}
$FixAutoMapping | Remove-MailboxPermission
$FixAutoMapping | ForEach {Add-MailboxPermission -Identity $_.Identity -User $_.User -AccessRights:FullAccess -AutoMapping $true} 