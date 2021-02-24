function Get-LastReboot {
<#
.SYNOPSIS
    Describe purpose of "Get-LastReboot" in 1-2 sentences.
.DESCRIPTION
    Add a more complete description of what the function does.
.EXAMPLE
    Get-LastReboot
    Describe what this call does
.NOTES
    Place additional notes here.
.LINK
    URLs to related sites
    The first link is opened by Get-Help -Online Get-LastReboot
.INPUTS
    List of input types that are accepted by this function.
.OUTPUTS
    List of output types produced by this function.
#>

    # fixme works improperly in pwsh
    # todo add write-verbose
    # todo add -uptime switch
    # todo rename to get-uptime

    [CmdletBinding(ConfirmImpact='None')]
    Param(
        [string[]] $ComputerName = $env:COMPUTERNAME,

        [switch] $IncludeComputerName
    )

    begin { }

    process {
        foreach ($currentComputer in $ComputerName) {
            $ReturnVal = Get-EventLog -LogName 'System' -ComputerName $currentComputer |
                Where-Object { $_.EventId -eq 6009 } |
                Select-Object -First 1 |
                Select-Object -ExpandProperty TimeGenerated

            if ($IncludeComputerName) {
                New-Object -TypeName 'psobject' -Property ([ordered] @{
                    ComputerName = $currentComputer
                    LastReboot   = $ReturnVal
                })
            } else {
                $ReturnVal
            }
        }

    }

    end { }
}
