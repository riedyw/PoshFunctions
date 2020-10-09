function Get-ComputerSite {
<#
.SYNOPSIS
    Describe purpose of "Get-ComputerSite" in 1-2 sentences.

.DESCRIPTION
    Add a more complete description of what the function does.

.PARAMETER ComputerName
    Describe parameter -ComputerName.

.EXAMPLE
    Get-ComputerSite -ComputerName Value
    Describe what this call does

.NOTES
    Place additional notes here.

.LINK
    URLs to related sites
    The first link is opened by Get-Help -Online Get-ComputerSite

.INPUTS
    List of input types that are accepted by this function.

.OUTPUTS
    List of output types produced by this function.
#>

    [CmdletBinding(ConfirmImpact='None')]
    param
    (
        [Parameter()]
        [string[]] $ComputerName = $env:COMPUTERNAME,

        [switch] $IncludeComputerName
    )

    begin {

    }

    process {
        foreach ($C in $ComputerName) {
            $site = nltest.exe /server:$C /dsgetsite 2>$null
            if ($LASTEXITCODE -eq 0) {
                if ($IncludeComputerName){
                    New-Object -TypeName 'psobject' -Property @{
                        ComputerName = $c
                        Site         = $site[0]
                    }
                } else {
                    $site[0]
                }
            }
        }
    }

    end {

    }

}
