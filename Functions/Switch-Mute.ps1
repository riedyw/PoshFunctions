function Switch-Mute {
<#
.SYNOPSIS
    Toggles speaker mute
.DESCRIPTION
    Toggles speaker mute
#>

    # toto Change any references of [New-Object -ComObject WScript.Shell] as it's being deprecated. Replace with [System.Windows.Forms*] which will continue to be supported

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
