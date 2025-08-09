#Set-ADComputer -Identity EXAMEN -TrustedForDelegation:$true
Get-ADComputer -Identity FILESERVER | Set-ADAccountControl -TrustedToAuthForDelegation $true #TrustedToAuthForDelegation permite usar cualquier protocolo. TrustedForDelegation kerberos solo
Set-ADComputer -Identity FILESERVER -Add @{'msDS-AllowedToDelegateTo'=@('TIME/domaincontrollername')}
