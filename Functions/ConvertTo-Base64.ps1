Function ConvertTo-Base64 {
<#
.SYNOPSIS
    ConvertTo-Base64 converts a normal string to a base 64 string
.DESCRIPTION
    ConvertTo-Base64 converts a normal string to a base 64 string
.PARAMETER String
    The string you want manipulated
.EXAMPLE
    ConvertTo-Base64 -String 'Password'

    Would return
    UABhAHMAcwB3AG8AcgBkAA==
.NOTES
    Author:     Bill Riedy
.OUTPUTS
    [string]
.LINK
    about_Properties
#>

    [CmdletBinding(ConfirmImpact='None')]
    param
    (
        [string] $String
    )

    Begin {

        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    Process {

        $bytesto = [System.Text.Encoding]::Unicode.GetBytes($String)
        $encodedto = [System.Convert]::ToBase64String($bytesto)
        Write-Output -InputObject $encodedto
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

}

Set-Alias -Name 'Base64Encode' -Value 'ConvertTo-Base64' -Description 'Alias for ConvertTo-Base64'
