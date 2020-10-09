Function ConvertFrom-Base64 {
<#
.SYNOPSIS
    Convert from a Base64 string to normal string
.DESCRIPTION
    Convert from a Base64 string to normal string
.PARAMETER StringFrom
    A base64 encoded string
.EXAMPLE
    ConvertFrom-Base64 "SABlAGwAbABvAA=="

    Would return
    Hello
.OUTPUTS
    [string]
.LINK
    about_Properties
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact='None')]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ValueFromPipeLine = $True)]
        [string] $StringFrom
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    } #close begin block

    process {
        $bytesfrom = [Convert]::FromBase64String($stringfrom)

        $decodedfrom = [Text.Encoding]::Unicode.GetString($bytesfrom)

        Write-Output -InputObject $decodedfrom

    }

    end {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

}

Set-Alias -Name 'Base64Decode' -Value 'ConvertFrom-Base64' -Description 'Alias for ConvertFrom-Base64'
