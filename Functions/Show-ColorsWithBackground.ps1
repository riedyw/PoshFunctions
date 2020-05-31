Function Show-ColorsWithBackground {
<#
.SYNOPSIS
    Show-ColorsWithBackground displays all combinations of foreground/background of the console colors.
.DESCRIPTION
    Show-ColorsWithBackground displays all combinations of foreground/background of the console colors.
.NOTES
    Author:     Bill Riedy
    Uses Write-Host to display colors and as such does not use the pipeline.
.LINK
    Write-Host
#>

    [CmdletBinding(ConfirmImpact='None')]
    Param ()

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    Process {
        $colors = [Enum]::GetValues( [ConsoleColor] )
        $bgcolors = $colors
        $max = ($colors | foreach-object { "$_ ".Length } | Measure-Object -Maximum).Maximum
        foreach ( $bgcolor in $bgcolors ) {
            write-host ("{0,2}{1,$max}" -f [int] $bgcolor, $bgcolor) -nonewline
            foreach ($color in $colors) {
                Write-Host ("{0,$max}" -f ,$color) -NoNewline -background $bgcolor -foreground $color
                #if ($color -eq "Gray") { write-host " " ; write-host "  " -NoNewLine}
            }
        write-host ' '
        }
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

} #EndFunction Show-ColorsWithBackground
