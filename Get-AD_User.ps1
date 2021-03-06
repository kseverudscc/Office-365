Import-Module ActiveDirectory
$(Foreach ($AD_User in Get-ADUser -Filter * -SearchBase 'OU=Academic & Admin Departments,DC=shore,DC=ctc,DC=edu' -Properties DisplayName, Initials){
	New-Object PSObject -Property @{
	FirstName = $AD_User.GivenName
    Initials = $AD_User.Initials
	LastName = $AD_User.Surname
	DisplayName = $AD_User.DisplayName
	}
}) | Select FirstName,Initials,LastName,DisplayName | Export-CSV C:\temp\ADUser.csv -NTI
