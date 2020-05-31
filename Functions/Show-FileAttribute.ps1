Function Show-FileAttribute {
<#
.SYNOPSIS
    Shows the available file attributes
.DESCRIPTION
    Shows the available file attributes
.NOTES
    Author:     Bill Riedy
.OUTPUTS
    [string[]]
#>

    [CmdletBinding(ConfirmImpact='None')]
    [outputtype([string[]])]
    Param (
    [switch] $IncludeValue
    )

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    Process {
        $datatype = 'System.IO.FileAttributes'
        if (-not $IncludeValue) {
            [enum]::GetNames($datatype)
        }
        else {
            [enum]::Getvalues($datatype) |
            foreach-object {
                [pscustomobject] @{
                    Name = $_.toString()
                    Dec = $_.value__
                    Hex = '0x{0:x}' -f ($_.value__)
                }
            }
        }
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

}
