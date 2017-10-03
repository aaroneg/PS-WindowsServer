$InstalledFeatures=Get-WindowsFeature |Where-Object {$_.Installed -eq $true}
$InstalledFeatures|Export-Clixml "$PSScriptRoot\$($env:COMPUTERNAME)Features.xml"
