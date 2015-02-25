$licensedAccountUserList = (Get-MsolUser -All -DomainName shoreline.edu).UserPrincipalName

foreach($addLicense in $licensedAccountUserList){
    Set-MsolUser -UserPrincipalName $addLicense -UsageLocation US
    Set-MsolUserLicense -UserPrincipalName $addLicense -AddLicenses shorelineccwa:POWER_BI_STANDARD
}
