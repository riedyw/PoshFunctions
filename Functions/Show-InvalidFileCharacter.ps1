Function Show-InvalidFileCharacter {
<#
.SYNOPSIS
    Shows invalid filename characters
.DESCRIPTION
    Shows invalid filename characters
#>

    [CmdletBinding(ConfirmImpact='None')]
    [outputtype([char[]])]
    Param ()

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    Process {
        [System.IO.Path]::GetInvalidFileNameChars()
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

}
