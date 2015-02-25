$readFile = Get-Content "c:\temp\UnlicensedEmployeeAccounts.csv"
#$myO365Sku1 = New-MsolLicenseOptions -AccountSkuId shorelineccwa:STANDARDWOFFPACK_FACULTY -DisabledPlans EXCHANGE_S_STANDARD
$myO365Sku1 = New-MsolLicenseOptions -AccountSkuId shorelineccwa:STANDARDWOFFPACK_IW_FACULTY
  
foreach($addLicense in $readFile){
    Set-MsolUser -UserPrincipalName $addLicense -UsageLocation US
	Set-MsolUserLicense -UserPrincipalName $addLicense -AddLicenses shorelineccwa:STANDARDWOFFPACK_IW_FACULTY
    Set-MsolUserLicense -UserPrincipalName $addLicense -AddLicenses shorelineccwa:POWER_BI_STANDARD
	Set-MsolUserLicense -UserPrincipalName $addLicense -LicenseOptions $myO365Sku1
}
