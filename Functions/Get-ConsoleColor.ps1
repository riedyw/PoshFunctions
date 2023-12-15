function Get-ConsoleColor {
<#
.SYNOPSIS
    Get-ConsoleColor displays the names and values of the console colors
.DESCRIPTION
    Get-ConsoleColor displays the names and values of the console colors
#>

    [CmdletBinding(ConfirmImpact='None')]
    [alias('Show-Color')] #FunctionAlias
    Param ()

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        [Enum]::GetValues([System.ConsoleColor]) |
            Select-Object -Property @{'Name' = 'Name'; 'Expression' = {$_.ToString()}},
                @{'Name' = 'Dec'; 'Expression' = {[Int] $_}},
                @{'Name' = 'Hex'; 'Expression' = {'0x{0:X1}' -f [Int] $_}}
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

} # EndFunction Get-ConsoleColor
