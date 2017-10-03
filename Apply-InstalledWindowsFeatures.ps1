# Change this path to the location of the sxs folder in the install media
$SourcePath="\\Server\Share\path\to\Windows Server 2016 x64\sources\sxs"
Function Get-FileName($initialDirectory)
{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
    
    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.initialDirectory = $initialDirectory
    $OpenFileDialog.filter = "XML (*Features.xml)| *Features.xml"
    $OpenFileDialog.ShowDialog() | Out-Null
    $OpenFileDialog.filename
}
$ConfigFile=Get-FileName $PSScriptRoot
$Config=Import-Clixml $ConfigFile
$Config|Install-WindowsFeature -Source $SourcePath

