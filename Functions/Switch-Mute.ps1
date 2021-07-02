function Switch-Mute {
<#
.SYNOPSIS
    Toggles speaker mute
.DESCRIPTION
    Toggles speaker mute
#>

    [CmdletBinding(ConfirmImpact='Low')]
    Param ()

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        $wshShell = New-Object -ComObject wscript.shell
        $wshShell.SendKeys([char]173)
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
