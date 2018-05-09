# Find all installed features
$InstalledFeatures=Get-WindowsFeature |Where-Object {$_.Installed -eq $true}
# Save them to disk
$InstalledFeatures|Export-Clixml "$PSScriptRoot\$($env:COMPUTERNAME)Features.xml"
