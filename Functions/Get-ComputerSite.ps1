function Get-ComputerSite {
<#
.SYNOPSIS
    Determines the Active Directory site of a specified computername(s). Relies on nltest.exe that comes with Windows
.DESCRIPTION
    Determines the Active Directory site of a specified computername(s). Relies on nltest.exe that comes with Windows
.PARAMETER ComputerName
    The computername you want to run the command against, defaults to $env:COMPUTERNAME. Aliased to 'CN', 'Server'
.PARAMETER IncludeInput
    Switch that will display input parameter in the output. Aliased to 'IncludeComputerName'
.EXAMPLE
    Get-ComputerSite

    Example result
    CORP
.EXAMPLE
    Get-ComputerSite -IncludeInput

    Example result
    ComputerName Site
    ------------ ----
    DEMOLAPTOP   CORP
#>

    [CmdletBinding(ConfirmImpact='None')]
    param
    (
        [Parameter(ValueFromPipeline)]
        [Alias('CN', 'Server')]
        [string[]] $ComputerName = $env:COMPUTERNAME,

        [Alias('IncludeComputerName')]
        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($curCN in $ComputerName) {
            $site = nltest.exe /server:$curCN /dsgetsite 2>$null
            if ($LASTEXITCODE -eq 0) {
                if ($IncludeInput) {
                    New-Object -TypeName 'psobject' -Property ([ordered] @{
                        ComputerName = $curCN
                        Site         = $site[0]
                    })
                } else {
                    $site[0]
                }
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
