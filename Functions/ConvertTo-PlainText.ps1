Function ConvertTo-PlainText {
<#
.SYNOPSIS
    Converts the System.Security.SecureString to plain text.
.PARAMETER SecureString
    The encrypted string to convert.
.EXAMPLE
    PS C:\> ConvertTo-PlainText -SecureString (Get-Credential).Password
.NOTES
    Author:
    Michael West
#>

    [CmdletBinding(ConfirmImpact='Low')]
    [OutputType('string')]
    param(
        [securestring] $SecureString
    )

    begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    } #close begin block

    process {
        [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecureString))
    }

    end {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    } #close end block

} #EndFunction ConvertTo-PlainText
