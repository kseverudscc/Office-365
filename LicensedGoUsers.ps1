$licensedAccountinguserList = Get-MsolUser -All |
  where {$_.IsLicensed -eq $true}

$outFile="C:\temp\LicensedGoUsers.csv"
foreach ($eachuser in $licensedAccountinguserList){
  $lineOut = $eachuser.UserPrincipalName
  Out-File -FilePath $outfile -Append -NoClobber `
   -InputObject $lineOut
}