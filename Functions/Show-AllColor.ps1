function Show-AllColor {
<#
.SYNOPSIS
    Shows all console colors
.DESCRIPTION
    Shows all console colors
#>

# todo rename to Show-ConsoleColor, function alias, update release notes

    [CmdletBinding(ConfirmImpact = 'None')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingWriteHost', '')]
    Param ()

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        $colors = [Enum]::GetValues( [ConsoleColor] )
        $maxName = ($colors | ForEach-Object { "$_ ".Length } | Measure-Object -Maximum).Maximum
        $colors | ForEach-Object -Begin {
            Write-Host ("{0,3} {1,$maxName} {2,-$maxName}" -f 'Dec', 'ColorName', 'Color'   )
            Write-Host ("{0,3} {1,$maxName} {2,-$maxName}" -f '===', ('=' * $maxName), ('=' * $maxName) )
        } -Process {
            Write-Host (" {0,2} {1,$maxName} " -f [int] $_, $_) -NoNewline
            Write-Host "$_" -ForegroundColor $_
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
