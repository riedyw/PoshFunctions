Function Get-SubnetMaskIPv4 {
<#
.SYNOPSIS
    Gets a dotted decimal subnet mask given the number of bits in the mask
.DESCRIPTION
    Gets a dotted decimal subnet mask given the number of bits in the mask. Can optionally include the number of bits.
.PARAMETER NetworkLength
    A mandatory [int] or array of [int] for which you want the subnet mask. Can be fed from the pipeline.
    Aliased to both 'Length' and 'CIDR'
.PARAMETER IncludeCIDR
    A switch controlling whether you want to see the CIDR length
.NOTES
    Author:     Bill Riedy
.EXAMPLE
    Get-SubnetMaskIPv4 -NetworkLength 22 -IncludeCIDR
    Would return something similar to the following:
    VERBOSE: $MinDate specified as [01/01/1969 00:00:00]
    VERBOSE: $MaxDate specified as [01/01/2040 00:00:00]
    VERBOSE: $MinDate ouside valid UnixEpoch setting to [01/01/1970 00:00:00]
    VERBOSE: $MaxDate ouside valid UnixEpoch setting to [01/19/2038 03:14:07]
    VERBOSE: The random date calculated is [12/26/1997 18:41:51]
    VERBOSE: The return value is [System.DateTime] datatype
    Friday, December 26, 1997 6:41:51 PM
.EXAMPLE
    11..16 | Get-SubnetMaskIPv4 -IncludeCIDR
    Would return:
    CIDR SubnetMask
    ---- ----------
      11 255.224.0.0
      12 255.240.0.0
      13 255.248.0.0
      14 255.252.0.0
      15 255.254.0.0
      16 255.255.0.0
.EXAMPLE
    Get-SubnetMaskIPv4 23
    Would return:
    255.255.254.0
.OUTPUTS
    [psobject]  if -IncludeCIDR switch specified
    [string]    default
.LINK
    https://www.Google.com
#>

    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline,Mandatory,HelpMessage='Enter the length of the subnet mask (1-32). Press ENTER with no other input to finish.')]
        [Alias('Length','CIDR')]
        [ValidateRange(1,32)]
        [int[]] $NetworkLength,

        [Parameter()]
        [switch] $IncludeCIDR
    )

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    process {
        foreach ($curLength in $NetworkLength) {
            $MaskBinary = ('1' * $curLength).PadRight(32, '0')
            $DottedMaskBinary = $MaskBinary -replace '(.{8}(?!\z))', '${1}.'
            $SubnetMask = ($DottedMaskBinary.Split('.') | foreach-object { [Convert]::ToInt32($_, 2) }) -join '.'
            if ($IncludeCIDR) {
                $prop = [ordered] @{ CIDR = $curLength ; SubnetMask = $SubnetMask }
                $obj = New-Object -typename PsObject -Property $prop
                $obj
            } else {
                $SubnetMask
            }
        }
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

}

Set-Alias -Name 'Get-SubnetMaskIP' -Value 'Get-SubnetMaskIPv4'
