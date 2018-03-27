$InterfaceName='Ethernet0'
$IPAddress='192.168.1.2'
$PrefixLength='27'
$DefaultGateway='192.168.1.1'
$DNSservers='192.168.0.1,8.8.8.8'
Get-NetIPAddress | Where {$_.InterfaceAlias -eq $InterfaceName } | Remove-NetIPAddress
Remove-NetRoute -InterfaceAlias $InterfaceName -DestinationPrefix 0.0.0.0/0 -Confirm:$false
New-NetIPAddress -InterfaceAlias $InterfaceName -IPAddress $IPAddress -PrefixLength PrefixLength -DefaultGateway $DefaultGateway
Set-DnsClientServerAddress -InterfaceAlias $InterfaceName -ServerAddresses $DNSServers
