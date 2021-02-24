function Show-Color {
<#
.SYNOPSIS
    Show-Color displays the names and values of the console colors
.DESCRIPTION
    Show-Color displays the names and values of the console colors
#>

    [CmdletBinding(ConfirmImpact='None')]
    Param ()

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        [Enum]::GetValues([System.ConsoleColor]) |
            Select-Object -Property @{'Name' = 'Name'; 'Expression' = {$_}},
                @{'Name' = 'Dec'; 'Expression' = {[Int] $_}},
                @{'Name' = 'Hex'; 'Expression' = {'0x{0:X1}' -f [Int] $_}}
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
