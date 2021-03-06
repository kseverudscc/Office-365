$Cred = Get-Credential
$Session = New-PSSession –ConfigurationName Microsoft.Exchange –ConnectionUri https://ps.outlook.com/powershell/ -Credential $Cred –Authentication Basic –AllowRedirection
Import-PSSession $Session –allowclobber
$remotecred = Get-Credential
New-MoveRequest -Identity rbachmann@shoreline.edu -Remote -RemoteHostName ‘mail.shoreline.edu’ -RemoteCredential $remotecred -TargetDeliveryDomain 'shorelineccwa.mail.onmicrosoft.com' -SuspendWhenReadyToComplete -BadItemLimit 20

New-MoveRequest -Identity stuOutreach@shoreline.edu -Remote -RemoteHostName ‘mail.shoreline.edu’ -RemoteCredential $remotecred -TargetDeliveryDomain 'shorelineccwa.mail.onmicrosoft.com' -BadItemLimit 40

Get-Recipient | where {$_.EmailAddresses -match "mkelly@shoreline.edu"} | fl Name, RecipientType, EmailAddresses


