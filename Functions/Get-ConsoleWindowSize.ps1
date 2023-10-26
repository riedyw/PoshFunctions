function Get-ConsoleWindowSize {
    <#
.SYNOPSIS
    Gets the current the window size and buffer size of the current console window
.DESCRIPTION
    Gets the current the window size and buffer size of the current console window
.EXAMPLE
    Get-ConsoleWindowSize

    BufferWidth BufferHeight WindowWidth WindowHeight
    ----------- ------------ ----------- ------------
            196        32766         196           21
#>

    [CmdletBinding()]
    param()

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.MyCommand)]"
    }

    process {
        $console = $Host.UI.RawUI

        $result = New-Object -TypeName psobject -Property ([ordered] @{
                BufferWidth  = $console.BufferSize.Width
                BufferHeight = $console.BufferSize.Height
                WindowWidth  = $console.WindowSize.Width
                WindowHeight = $console.WindowSize.Height
            })
            Write-Output -InputObject $result
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.MyCommand)]"
    }

}
