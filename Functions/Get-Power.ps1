function Get-Power {
<#
.SYNOPSIS
    Provides exponentian
.DESCRIPTION
    Provides exponentian, also called power as in "2 to the power 3" equals 8
.PARAMETER Base
    The base number that will be raised to a power
.PARAMETER Power
    To what level the exponentian will go. Defaults to 1.
.PARAMETER IncludeOriginal
    A switch to determine if you want the input parameters to be included in the output
.NOTES
    To do square or cube roots invert the power.
        square root, -Power (1/2)
        cube root, -Power (1/3)
    and so on.
.EXAMPLE
    Get-Power -Base 2 -Power 3

    Returns 8
.EXAMPLE
    Get-Power -Base 2 -Power 10

    Returns 1024
.EXAMPLE
    Get-Power -Base 4 -Power 0.5

    Returns 2
.EXAMPLE
    Get-Power -Base 2 -Power 5 -IncludeOriginal

    Base Power Result
    ---- ----- ------
    2     5     32
.EXAMPLE
    Get-Power -Base 27 -Power (1/3) -IncludeOriginal

    Base             Power Result
    ----             ----- ------
    27 0.333333333333333      3
.OUTPUTS
    [double]
.LINK
#>

    #region parameter
    [CmdletBinding(ConfirmImpact='Low')]
    [OutputType('double')]
    Param (
        [parameter(Mandatory,HelpMessage='Enter the base number you wish to be exponentiated',Position=0,ValueFromPipeline)]
        [double[]] $Base,

        [parameter(Position=1)]
        [double] $Power = 1,

        [switch] $IncludeOriginal
    )
    #endregion parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($currentNumber in $Base) {
            $ReturnVal = [double] [math]::Pow($currentNumber,$Power)
            if ($IncludeOriginal) {
                New-Object -TypeName 'psobject' -Property ([ordered] @{
                    Base   = $currentNumber
                    Power  = $Power
                    Result = $ReturnVal
                })
            } else {
                Write-Output -InputObject $ReturnVal
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
