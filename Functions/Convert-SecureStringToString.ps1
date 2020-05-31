# inspired by: https://gallery.technet.microsoft.com/Execute-PowerShell-Script-38881dce

function Convert-SecureStringToString {
<#
.SYNOPSIS
    Converts a SecureString value back to a plaintext string
.DESCRIPTION
    Converts a SecureString value back to a plaintext string
.PARAMETER SecureString
    The SecureString that you want to get back to being plaintext
.EXAMPLE
    $SecureString = Read-Host -Prompt 'Enter a string' -AsSecureString
    #Let's say you entered the string 'Password' without quotes

    Convert-SecureStringToString -SecureString $SecureString

    Password
#>

    [CmdletBinding(ConfirmImpact='Low')]
    [OutputType('string')]
    Param (
        [Parameter(Mandatory)]
        [System.Security.SecureString] $SecureString
    )

    $UserName = 'domain\user'
    $Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $UserName, $SecureString
    $Credential.GetNetworkCredential().Password

}
