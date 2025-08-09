Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\" -Name fDenyTSConnections -Value 0
Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\" -Name UserAuthentication -Value 0
Enable-NetFirewallRule -DisplayGroup "Escritorio Remoto"
