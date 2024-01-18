function Read-HostPause {
<#
.SYNOPSIS
    To more closely mimic the behavior of PAUSE in cmd.exe where you only have to press a key
.DESCRIPTION
    To more closely mimic the behavior of PAUSE in cmd.exe where you only have to press a key
.PARAMETER Prompt
    The message to be displayed. Defaults to 'Press any key to continue...'
.PARAMETER ForegroundColor
    String representing the foreground color. Validates against the console color names in English. Defaults to 'Gray'
.EXAMPLE
    Read-HostPause -ForegroundColor Cyan

    Displays 'Press any key to continue...' in Cyan and waits until a key is pressed.
#>

    [cmdletbinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingWriteHost', '')]
    param(
        [Parameter(Position = 0)]
        [string] $Prompt = 'Press any key to continue...',

        [Parameter(Position = 1)]
        [ValidateSet('Black', 'DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Gray',
            'DarkGray', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Yellow', 'White')]
        [string] $ForegroundColor = 'Gray'
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        if ($psISE) {
            # The "ReadKey" functionality is not supported in Windows PowerShell ISE.
            $Shell = New-Object -ComObject "WScript.Shell"
            $null = $Shell.Popup('Click [OK] to continue.', 0, 'Script Paused', 0)
            Return
        } else {
            Write-Host -NoNewline -ForegroundColor $ForegroundColor -Object $Prompt
            $null = [System.Console]::ReadKey($false)
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
