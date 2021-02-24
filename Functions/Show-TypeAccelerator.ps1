function Show-TypeAccelerator {
<#
.SYNOPSIS
    Shows type accelerators
.DESCRIPTION
    Shows type accelerators [int32] [datetime] etc.
.PARAMETER MatchString
    String to limit the display to those type accelerators that match the string specified
.NOTES
    The additional entries in the result set does not display properly in Powershell versions prior to 7.x and extra logic added to handle
#>

    [CmdletBinding(ConfirmImpact = 'None')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter','')]
    Param (
        [string] $MatchString = ''
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        if ($psversiontable.psversion.major -ge 7) {
            $split = "`n"
        } else {
            $split = "`r`n"
        }
        $HereString = @"
Name,FullName
arraylist,System.Collections.ArrayList
bitarray,System.Collections.BitArray
dns,System.Net.Dns
enum,System.Enum
ordered,System.Collections.Specialized.Order
ping,System.Net.NetworkInformation.Ping
pingoptions,System.Net.NetworkInformation.PingOptions
queue,System.Collections.Queue
stack,System.Collections.Stack
timezoneinfo,System.TimeZoneInfo
webclient,System.Net.WebClient
webrequest,System.Net.WebRequest
"@
        $ToAddArray = $HereString -split $split | ConvertFrom-Csv
        Write-Verbose -Message "ToAddArray has [$($ToAddArray.count)] entries"
    }

    process {
        $tmpObj = [PSObject].Assembly.GetType('System.Management.Automation.TypeAccelerators')::Get.GetEnumerator()
        # [PSObject].Assembly.GetType('System.Management.Automation.TypeAccelerators')::Get
        #  $ReturnVal = $tmpObj::Get.GetEnumerator() | Where-Object { $_.Value.Name -notlike '*Attribute*' } |
        $ReturnVal = $tmpObj | Select-Object -Property @{Name = 'Name'; Expr = { $_.Key } }, @{Name = 'FullName'; Expr = { $_.Value } }
        $ReturnVal += $ToAddArray
        $ReturnVal = $ReturnVal | Sort-Object -Property Name -Unique
        $ReturnVal | Where-Object { ($_.Name -match $MatchString) -or ($_.FullName -match $MatchString) }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
