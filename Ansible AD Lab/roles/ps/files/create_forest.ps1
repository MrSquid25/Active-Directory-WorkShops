function Add-ADForestTrust {

<#

.Synopsis

  Simple function to create a inbound, outbound or bidirectional AD forest trust.

.DESCRIPTION

  Simple function to create a inbound, outbound or bidirectional AD forest trust.

.EXAMPLE

   C:\> Add-ADForestTrust -RemoteForest partner.forest.com -TrustDirection Bidirectional

   Creates a bi-directional AD forest trust between local forest and partner.forest.com remote forest.

#>

   param (

       # FQDN of the target forest

       [Parameter(Mandatory=$true)]

       [string]$RemoteForest,

       # Credentials with the rights to create a trust in the remote forest.

       [Parameter(Mandatory=$true)]

       [pscredential]$Credentials,

       # Direction of the trust related to local forest.

       [Parameter(Mandatory=$true)]

       [System.DirectoryServices.ActiveDirectory.TrustDirection]$TrustDirection

   )

   $remoteContext = New-Object -TypeName "System.DirectoryServices.ActiveDirectory.DirectoryContext" -ArgumentList @(

       "Forest",

       $RemoteForest,

       $Credentials.UserName,

       $Credentials.GetNetworkCredential().Password

   )

   try {

       $remoteForestObj = [System.DirectoryServices.ActiveDirectory.Forest]::getForest($remoteContext)

       #Write-Host "GetRemoteForest: Succeeded for domain $($remoteForest)"

       Write-Host "Connected to Remote forest: $($remoteForestObj.Name)"

   } catch {

       Write-Warning "GetRemoteForest: Failed:`n`tError: $($($_.Exception).Message)"

       Continue

   }

   $localforest=[System.DirectoryServices.ActiveDirectory.Forest]::getCurrentForest()

   Write-Host "Connected to Local forest: $($localforest.Name)"

   try {

       $localForest.CreateTrustRelationship($remoteForestObj,$TrustDirection)

       Write-Host "CreateTrustRelationship: Succeeded for domain $($remoteForestObj.Name)"

   } catch {

       Write-Warning "CreateTrustRelationship: Failed for domain $($remoteForestObj.Name)`n`tError: $($($_.Exception).Message)"

   }

}

$user= 'SECURE\Administrador'; $password1= ConvertTo-SecureString 'Passw0rd!' -AsPlainText -Force; $psCred= New-Object System.Management.Automation.PSCredential -ArgumentList ($user, $password1)

Add-ADForestTrust -RemoteForest secure.domain -TrustDirection BiDirectional -Credentials $psCred
