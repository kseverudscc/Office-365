Get-MailboxFolderPermission -identity "kseverud@shoreline.edu:\Calendar"

Remove-MailboxFolderPermission -Identity mkelemen@shoreline.edu:\Calendar -User "Sampson, Diana" 

Get-MailboxImportRequest | ?{ $_.RequestQueue -eq "Student Government"}

Remove-MailboxImportRequest -RequestGuid 616dd5f5-390a-4955-b33f-a4293239d453