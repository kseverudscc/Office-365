$licensedAccountinguserList = Get-MsolUser -All  -DomainName shoreline.edu | where {$_.IsLicensed -eq $false}

$outFile="C:\temp\UnlicensedEmployeeAccounts.csv"
foreach ($eachuser in $licensedAccountinguserList){
  $lineOut = $eachuser.UserPrincipalName
  Out-File -FilePath $outfile -Append -NoClobber `
   -InputObject $lineOut
}