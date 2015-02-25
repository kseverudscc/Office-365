$licensedAccountinguserList = Get-MsolUser -All -DomainName go.shoreline.edu | where {$_.IsLicensed -eq $false}

$outFile="C:\temp\UnlicensedStudents.csv"
foreach ($eachuser in $licensedAccountinguserList){
  $lineOut = $eachuser.UserPrincipalName
  Out-File -FilePath $outfile -Append -NoClobber `
   -InputObject $lineOut
}