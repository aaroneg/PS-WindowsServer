throw "Read file and save the current state of your services before running this"
# Disable the stupid, useless services that 2016 in GUI mode comes with by default to reduce attack surface
# Refer to https://docs.microsoft.com/en-us/windows-server/security/windows-services/security-guidelines-for-disabling-system-services-in-windows-server
$DisableServices=@(
    'XblGameSave',
    'XblAuthManager',
    'MapsBroker',
    'AxInstSV',
    'AJRouter',
    'bthserv',
    'dmwappushservice',
    'lfsvc',
    'SharedAccess',
    'wlidsvc',
    'NcbService',
    'PhoneSvc',
    'PcaSvc',
    'QWAVE',
    'RmSvc',
    'SensorDataService',
    'SensrSvc',
    'SensorService',
    'ShellHWDetection',
    'ScDeviceEnum',
    'SSDPSRV',
    'WiaRpc',
    'upnphost',
    'WalletService',
    'Audiosrv',
    'AudioEndpointBuilder',
    'FrameServer',
    'stisvc',
    'wisvc',
    'WpnService'
)

ForEach-Object -InputObject $DisableServices {Get-Service -Name $_ | Set-Service -StartupType Disabled}

# Disable scheduled tasks for XBox
Get-ScheduledTask -TaskName XblGameSaveTask | Disable-ScheduledTask
Get-ScheduledTask -TaskName XblGameSaveTaskLogon | Disable-ScheduledTask

