function Get-DNSHostEntryAsync {
<#
.SYNOPSIS
    Performs a DNS Get Host asynchronously
.DESCRIPTION
    Performs a DNS Get Host asynchronously
.EXAMPLE
    Get-DNSHostEntryAsync -Computername google.com,prox-hyperv,bing.com, github.com, powershellgallery.com, powershell.org
.EXAMPLE
    Get-DNSHostEntryAsync -ComputerName 8.8.8.8, ibm.com

    Would return:
    ComputerName Result
    ------------ ------
    8.8.8.8      dns.google
    ibm.com      129.42.38.10
.OUTPUTS
    Net.AsyncGetHostResult
.NOTES
    Inspired by: Get-DNSHostEntryAsync by Boe Prox

    Changes:
    * added example to comment based help
    * slight formatting changes
#>

    #Requires -Version 3.0
    [OutputType('Net.AsyncGetHostResult')]
    [CmdletBinding(ConfirmImpact='None')]
    Param (
        [parameter(ValueFromPipeline)]
        [Alias('CN', 'Server')]
        [string[]] $ComputerName
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $Computerlist = New-Object -TypeName System.Collections.ArrayList
        if ($PSBoundParameters.ContainsKey('ComputerName')) {
            $null = $Computerlist.AddRange($ComputerName)
        } else {
            $IsPipeline = $True
        }
    }

    process {
        If ($IsPipeline) {
            $null = $Computerlist.Add($ComputerName)
        }
    }

    end {
        $Task = ForEach ($Computer in $Computername) {
            If (([bool]($Computer -as [ipaddress]))) {
                [pscustomobject] @{
                    Computername = $Computer
                    Task = [system.net.dns]::GetHostEntryAsync($Computer)
                }
            } Else {
                [pscustomobject] @{
                    Computername = $Computer
                    Task = [system.net.dns]::GetHostAddressesAsync($Computer)
                }
            }
        }
        try {
            $null = [Threading.Tasks.Task]::WaitAll($Task.Task)
        } catch { Write-Error -Message 'Error encountered'}
        $Task | ForEach-Object {
            $Result = if ($_.Task.IsFaulted) {
                $_.Task.Exception.InnerException.Message
            } else {
                if ($_.Task.Result.IPAddressToString) {
                    $_.Task.Result.IPAddressToString
                } else {
                    $_.Task.Result.HostName
                }
            }
            $Object = [pscustomobject] @{
                ComputerName = $_.Computername
                Result = $Result
            }
            $Object.pstypenames.insert(0,'Net.AsyncGetHostResult')
            $Object
        }
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
