function Get-Factorial {
    <#
.SYNOPSIS
    Determine the factorial of a given integer value
.DESCRIPTION
    Recursive function to determine the factorial of a given integer value. Values must be in range of 0-20
.PARAMETER Value
    Array of integers each of which should be in the range of 0-20. Accepts values from the pipeline
.PARAMETER IncludeInput
    Switch to include the input parameter into the output
.EXAMPLE
    Get-Factorial -Value 5

    120
.EXAMPLE
    Get-Factorial -Value (1..5) -IncludeInput

    Value Factorial
    ----- ---------
        1         1
        2         2
        3         6
        4        24
        5       120
.EXAMPLE
    1..5 | Get-Factorial -IncludeInput

    Value Factorial
    ----- ---------
        1         1
        2         2
        3         6
        4        24
        5       120
.EXAMPLE
    Get-Factorial -Value 3 -Verbose

    VERBOSE: Starting [Get-Factorial]
    VERBOSE: CurValue is [3]
    VERBOSE: Starting [Get-Factorial]
    VERBOSE: CurValue is [2]
    VERBOSE: Starting [Get-Factorial]
    VERBOSE: CurValue is [1]
    VERBOSE: Ending [Get-Factorial]
    VERBOSE: Ending [Get-Factorial]
    6
    VERBOSE: Ending [Get-Factorial]
.EXAMPLE
    Get-Factorial -Value -1

    Get-Factorial : CurValue [-1] must be between 0 and 20
    At line:1 char:1
    + Get-Factorial -Value -1
    + ~~~~~~~~~~~~~~~~~~~~~~~
        + CategoryInfo          : NotSpecified: (:) [Write-Error], WriteErrorException
        + FullyQualifiedErrorId : Microsoft.PowerShell.Commands.WriteErrorException,Get-Factorial
#>

    [cmdletbinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [int[]] $Value,

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($CurValue in $Value) {
            Write-Verbose -Message "CurValue is [$CurValue]"
            if (($CurValue -lt 0) -or ($CurValue -gt 20)) {
                Write-Error -Message "CurValue [$CurValue] must be between 0 and 20"
            } else {
                if ($CurValue -eq 0) {
                    [int64] $Result = 0
                } elseif ($CurValue -eq 1) {
                    [int64] $Result = 1
                } else {
                    [int64] $Result = $CurValue * (Get-Factorial -Value ($CurValue - 1))
                }
                if ($IncludeInput) {
                    New-Object -TypeName psobject -Property ([ordered] @{
                            Value     = $CurValue
                            Factorial = $Result
                        })
                } else {
                    Write-Output $Result
                }
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
