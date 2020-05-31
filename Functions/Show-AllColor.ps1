Function Show-AllColor {
<#
.SYNOPSIS
    Shows all console colors
.DESCRIPTION
    Shows all console colors
.NOTES
    Author:     Bill Riedy
#>

    [CmdletBinding(ConfirmImpact='None')]
    Param ()

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    Process {
        $colors = [Enum]::GetValues( [ConsoleColor] )
        $maxName = ($colors | foreach-object { "$_ ".Length } | Measure-Object -Maximum).Maximum
        $colors | foreach-object -begin {
                Write-Host ("{0,3} {1,$maxName} {2,-$maxName}" -f 'Dec', 'ColorName', 'Color'   )
                Write-Host ("{0,3} {1,$maxName} {2,-$maxName}" -f '===', ('='*$maxName), ('='*$maxName) )
            } -process {
                Write-Host (" {0,2} {1,$maxName} " -f [int] $_,$_) -NoNewline
                Write-Host "$_" -Foreground $_
            }
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

} #EndFunction Show-AllColor
