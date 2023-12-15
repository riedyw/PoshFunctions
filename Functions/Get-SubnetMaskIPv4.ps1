function Get-SubnetMaskIPv4 {
<#
.SYNOPSIS
    Gets a dotted decimal subnet mask given the number of bits in the mask
.DESCRIPTION
    Gets a dotted decimal subnet mask given the number of bits in the mask. Can optionally include the number of bits.
.PARAMETER Length
    A mandatory [int] or array of [int] for which you want the subnet mask. Can be fed from the pipeline.
    Aliased to both 'NetworkLength' and 'CIDR'
.PARAMETER IncludeInput
    A switch controlling whether you want to see the CIDR length. Aliased to 'IncludeCIDR' for backward compatibility
.EXAMPLE
    Get-SubnetMaskIPv4 -Length 22 -IncludeInput

    Length SubnetMask
    ------ ----------
        22 255.255.252.0
.EXAMPLE
    22..25 | Get-SubnetMaskIPv4 -IncludeInput

    Length SubnetMask
    ------ ----------
        22 255.255.252.0
        23 255.255.254.0
        24 255.255.255.0
        25 255.255.255.128
.EXAMPLE
    Get-SubnetMaskIPv4 23
    Would return:
    255.255.254.0
.OUTPUTS
    [psobject]  if -IncludeInput switch specified
    [string]    default
.LINK
    https://www.Google.com
#>

    [CmdletBinding()]
    [alias('Get-SubnetMaskIP')] #FunctionAlias
    param(
        [Parameter(ValueFromPipeline,Mandatory,HelpMessage='Enter the length of the subnet mask (1-32). Press ENTER with no other input to finish.')]
        [Alias('NetworkLength','CIDR')]
        [ValidateRange(1,32)]
        [int[]] $Length,

        [Alias('IncludeCIDR')]
        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($curLength in $Length) {
            $MaskBinary = ('1' * $curLength).PadRight(32, '0')
            $DottedMaskBinary = $MaskBinary -replace '(.{8}(?!\z))', '${1}.'
            $SubnetMask = ($DottedMaskBinary.Split('.') | foreach-object { [Convert]::ToInt32($_, 2) }) -join '.'
            if ($IncludeInput) {
                New-Object -typename PsObject -Property ([ordered] @{
                    Length = $curLength
                    SubnetMask = $SubnetMask
                })
            } else {
                Write-Output -InputObject $SubnetMask
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
