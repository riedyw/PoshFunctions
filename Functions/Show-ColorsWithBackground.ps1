function Show-ColorsWithBackground {
    <#
            .SYNOPSIS
            Show-ColorsWithBackground displays all combinations of foreground/background of the console colors.
            .DESCRIPTION
            Show-ColorsWithBackground displays all combinations of foreground/background of the console colors.
            .NOTES
            Uses Write-Host to display colors and as such does not use the pipeline.
            Formatted output
            .LINK
            Write-Host
    #>

    # todo rename to Show-ConsoleColorWithBackground, update readme

    [CmdletBinding(ConfirmImpact='None')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingWriteHost','')]
    Param ()

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        $colors = [Enum]::GetValues( [ConsoleColor] )
        $bgcolors = $colors
        $max = ($colors | ForEach-Object { "$_ ".Length } | Measure-Object -Maximum).Maximum
        foreach ( $bgcolor in $bgcolors ) {
            Write-Host ("{0,2}{1,$max}" -f [int] $bgcolor, $bgcolor) -NoNewline
            foreach ($color in $colors) {
                Write-Host (" {0}" -f ,$color) -NoNewline -BackgroundColor $bgcolor -ForegroundColor $color
                #if ($color -eq "Gray") { write-host " " ; write-host "  " -NoNewLine}
            }
            Write-Host ' '
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
