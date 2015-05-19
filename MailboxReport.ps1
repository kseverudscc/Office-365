$(Foreach ($mailbox in Get-Recipient -ResultSize Unlimited -OrganizationalUnit Domain.com/HQ/Users -RecipientType UserMailbox){
$Stat = $mailbox | Get-MailboxStatistics | Select TotalItemSize,ItemCount
	New-Object PSObject -Property @{
	FirstName = $mailbox.FirstName
	LastName = $mailbox.LastName
	DisplayName = $mailbox.DisplayName
	TotalItemSize = $Stat.TotalItemSize
	ItemCount = $Stat.ItemCount
	PrimarySmtpAddress = $mailbox.PrimarySmtpAddress
	Alias = $mailbox.Alias
	}
}) | Select FirstName,LastName,DisplayName,TotalItemSize,ItemCount,PrimarySmtpAddress,Alias | 
Export-CSV C:\MailboxReport.csv -NTI