function Get-TypeAccelerator {
<#
.SYNOPSIS
    Gets type accelerators
.DESCRIPTION
    Gets type accelerators [int32] [datetime] etc. Function aliased to 'Show-TypeAccelerator'
    for backward compatibility.
.PARAMETER MatchString
    String to limit the display to those type accelerators that match the string specified
.NOTES
    This function contains a here string. The contents of the here string to its closing token MUST, MUST, MUST be at column 0. Autoformatting and indentation will break the here string. Please do NOT autoformat this document.
.EXAMPLE
    Get-TypeAccelerator -MatchString array

    Name      FullName
    ----      --------
    array     System.Array
    arraylist System.Collections.ArrayList
    bitarray  System.Collections.BitArray
.EXAMPLE
    Get-TypeAccelerator -MatchString 32

    Name   FullName
    ----   --------
    int    System.Int32
    int32  System.Int32
    uint32 System.UInt32
#>

    # todo Change += to System.Collections.Arraylist

    [CmdletBinding(ConfirmImpact = 'None')]
    [alias('Show-TypeAccelerator')] #FunctionAlias
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
         # The contents of the here string to its closing token MUST, MUST, MUST be at column 0. Autoformatting and indentation will break the here string.
        $HereString = @'
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
'@
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
