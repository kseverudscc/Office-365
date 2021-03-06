Enable-RemoteMailbox ssingleton -RemoteRoutingAddress ssingleton@shorelineccwa.mail.onmicrosoft.com -PrimarySmtpAddress ssingleton@shoreline.edu -archive

Set-RemoteMailbox -Identity ssingleton@shoreline.edu -EmailAddresses @{add='ssingleton@shorelineccwa.mail.onmicrosoft.com'}

Get-MoveRequest | Where-Object {$_.Status -eq "AutoSuspended"} | Resume-MoveRequest
Get-MoveRequest -MoveStatus Completed | Remove-MoveRequest
Get-MoveRequest -MoveStatus CompletedWithWarning | Remove-MoveRequest