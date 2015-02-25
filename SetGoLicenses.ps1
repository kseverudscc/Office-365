$licensedAccountUserList = (Get-MsolUser -All -DomainName go.shoreline.edu).UserPrincipalName
#$licensedAccountUserList = "lonnie.williams@go.shoreline.edu"
$myO365Sku1 = New-MsolLicenseOptions -AccountSkuId shorelineccwa:STANDARDWOFFPACK_IW_STUDENT -DisabledPlans EXCHANGE_S_STANDARD

foreach($addLicense in $licensedAccountUserList){

    Set-MsolUser -UserPrincipalName $addLicense -UsageLocation US
    Set-MsolUserLicense -UserPrincipalName $addLicense -RemoveLicenses shorelineccwa:STANDARDWOFFPACK_IW_STUDENT
	Set-MsolUserLicense -UserPrincipalName $addLicense -AddLicenses shorelineccwa:STANDARDWOFFPACK_IW_STUDENT
    Set-MsolUserLicense -UserPrincipalName $addLicense -AddLicenses shorelineccwa:POWER_BI_STANDARD
	Set-MsolUserLicense -UserPrincipalName $addLicense -LicenseOptions $myO365Sku1
}
