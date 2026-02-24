$oupath = "DC=milo,DC=local"
$allpath = "OU=TESTING,DC=milo,DC=local"
$delpath = "OU=Test OU,DC=milo,DC=local"

New-ADOrganizationalUnit -Name "TESTING" -Path $oupath -ProtectedFromAccidentalDeletion $false

Get-ADUser -Identity "milo.sanokklis" | Move-ADObject -TargetPath $allpath

Get-ADcomputer -Identity "WKS01-MILO" | Move-ADObject -TargetPath $allpath

Set-ADObject -Identity $delpath -ProtectedFromAccidentalDeletion $false

Remove-ADOrganizationalUnit -Identity $delpath -Recursive -Confirm:$False
