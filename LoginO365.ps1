$cred = Import-Clixml C:\fso\cred.xml
Connect-MsolService -Credential $cred