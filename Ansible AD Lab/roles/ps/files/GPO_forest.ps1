#Creamos la GPO Registry
$GPOExists = (Get-GPO -Name "Registry" -ErrorAction Ignore).DisplayName -eq "Registry"
if ($GPOExists) {Remove-GPO -Name "Registry"}

#Creamos una GPO
New-GPO "Registry"

#Desactivamos que se vean en el login los usuarios que hay activos --> Dontdisplayusername
#https://winbuzzer.com/2020/07/01/windows-10-how-to-enable-do-not-display-last-user-name-on-sign-in-screen-xcxwbt/

Set-GPPrefRegistryValue -Name "Registry" -Context Computer -Key HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -ValueName dontdisplaylastusername -Value 1 -Type DWORD -Action Create

#Activamos el uselogoncredentials para que se cacheen a pelo en memoria
#https://www.csoonline.com/article/3438824/how-to-detect-and-halt-credential-theft-via-windows-wdigest.html

Set-GPPrefRegistryValue -Name "Registry" -Context Computer -Key HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest -ValueName UseLogonCredential -Value 1 -Type DWORD -Action Create

#Local Account TOken Filter Policy --> Deshabilitar UAC
#https://admx.help/?Category=SecurityBaseline&Policy=Microsoft.Policies.PtH::Pol_PtH_LATFP

Set-GPPrefRegistryValue -Name "Registry" -Context Computer -Key HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -ValueName LocalAccountTokenFilterPolicy -Value 1 -Type DWORD -Action Create

New-GPLink -Target "DC=domain,DC=local" -Name Registry

##############################################################################################

$GPOExists = (Get-GPO -Name "RDP" -ErrorAction Ignore).DisplayName -eq "RDP"
if ($GPOExists) {Remove-GPO -Name "RDP"}

#Creamos la GPO (esta GPO habilita mas de 20 conexiones RDP, permite que hay amas de una sesion por usuario)
New-GPO RDP

#Importamos la GPO
Import-GPO -BackupId 5E04D535-1290-4AA6-9FE5-82A7C70A82DB -TargetName RDP -path "C:\Users\Administrador\Downloads\"
New-GPLink -Target "DC=secure,DC=local" -Name RDP
