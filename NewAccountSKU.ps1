$OldActSku = get-MsolAccountSku | where-object {$_.AccountSkuId -eq "shorelineccwa:STANDARDWOFFPACK_FACULTY"}
$NewActSku = get-MsolAccountSku | where-object {$_.AccountSkuId -eq "shorelineccwa:STANDARDWOFFPACK_IW_FACULTY"}
#
#SET THE LICENSE FOR ALL USERS THAT HAVE THE OLD LICENSE TO THE NEW LICENSE
#
get-msoluser -all | where-object {$_.Licenses[0].AccountSkuId -eq $OldActSku.AccountSkuId} | Set-MsolUserLicense -RemoveLicenses $OldActSku.AccountSkuId -AddLicenses $NewActSku.AccountSkuId