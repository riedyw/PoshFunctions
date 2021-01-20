Function Get-DNSHostEntryAsync {
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
    Name: Get-DNSHostEntryAsync
    Author: Boe Prox
    Version History:
        1.0 - Boe Prox - 12/24/2015
            - Initial result

    Changes:
    * added example to comment based help
    * slight formatting changes
#>

    #Requires -Version 3.0
    [OutputType('Net.AsyncGetHostResult')]
    [CmdletBinding(ConfirmImpact='None')]
    Param (
        [parameter(ValueFromPipeline)]
        [string[]] $ComputerName
    )

    begin {
        $Computerlist = New-Object -TypeName System.Collections.ArrayList
        If ($PSBoundParameters.ContainsKey('ComputerName')) {
            $null = $Computerlist.AddRange($ComputerName)
        } Else {
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
        Try {
            $null = [Threading.Tasks.Task]::WaitAll($Task.Task)
        } Catch {}
        $Task | ForEach {
            $Result = If ($_.Task.IsFaulted) {
                $_.Task.Exception.InnerException.Message
            } Else {
                If ($_.Task.Result.IPAddressToString) {
                    $_.Task.Result.IPAddressToString
                } Else {
                    $_.Task.Result.HostName
                }
            }
            $Object = [pscustomobject]@{
                ComputerName = $_.Computername
                Result = $Result
            }
            $Object.pstypenames.insert(0,'Net.AsyncGetHostResult')
            $Object
        }
    }

}
