Get-MoveRequest | Where-Object {$_.Status -eq "AutoSuspended"} | Resume-MoveRequest
Get-MoveRequest -MoveStatus Completed | Remove-MoveRequest