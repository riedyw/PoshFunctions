function Show-ConsoleColor {
<#
.SYNOPSIS
    Shows all console colors
.DESCRIPTION
    Shows all console colors
#>

    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingWriteHost', '')]
    [CmdletBinding(ConfirmImpact = 'None')]
    [Alias('Show-AllColor')] #FunctionAlias
    param ()

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        $ConsoleColor = [Enum]::GetValues([ConsoleColor])

        $MaxName = ($ConsoleColor | ForEach-Object { "$_ ".Length } | Measure-Object -Maximum).Maximum
        $ConsoleColor | ForEach-Object -Begin {
            Write-Host ("{0,3} {1,$MaxName} {2,-$MaxName}" -f 'Dec', 'ColorName', 'Color'   )
            Write-Host ("{0,3} {1,$MaxName} {2,-$MaxName}" -f '===', ('=' * $MaxName), ('=' * $MaxName) )
        } -Process {
            Write-Host (" {0,2} {1,$MaxName} " -f [int] $_, $_) -NoNewline
            Write-Host "$_" -ForegroundColor $_
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
