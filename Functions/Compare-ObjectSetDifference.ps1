function Compare-ObjectSetDifference {
    <#
.SYNOPSIS
    Compares 2 arrays of strings and returns The SET DIFFERENCE of the arrays
.DESCRIPTION
    Compares 2 arrays of strings and returns The SET DIFFERENCE of the arrays. Optionally case sensitive.
.PARAMETER ReferenceObject
    The array that is the baseline. Aliased to 'RO', 'Left'
.PARAMETER DifferenceObject
    The array that is being compared to the baseline set. Aliased to 'DO', 'Right'
.PARAMETER CaseSensitive
    Switch indicating that a case sensitive comparison should be made. Aliased to 'CS'
.EXAMPLE
    Compare-ObjectSetDifference -ReferenceObject a,b,c -DifferenceObject a,c -CaseSensitive
    b
.EXAMPLE
    Compare-ObjectSetDifference -ReferenceObject a,b,c -DifferenceObject a,b,C -CaseSensitive
    c
.EXAMPLE
    Compare-ObjectSetDifference -ReferenceObject a,b,c -DifferenceObject a,b,D
    c
.EXAMPLE
    Compare-ObjectSetDifference -ReferenceObject a,b,c -DifferenceObject a,b,C
    $null
.NOTES
    Inspired by:
    https://sqljana.wordpress.com/2015/09/23/perform-set-operations-union-intersection-minus-complement-using-powershell/
    http://www.cs.odu.edu/~toida/nerzic/content/set/set_operations.html
    http://www.dummies.com/how-to/content/find-the-union-intersection-relative-complement-an.html

    Added PSReviewUnusedParameter to prevent Invoke-ScriptAnalyzer from returning a false positive
#>

    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', '')]
    [OutputType('psobject')]
    param (
        [Alias('RO', 'Left')]
        [string[]] $ReferenceObject,

        [Alias('DO', 'Right')]
        [string[]] $DifferenceObject,

        [Alias('CS')]
        [switch] $CaseSensitive

    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        if ($CaseSensitive) {
            $ReferenceObject | where-object { -not ($_ -cin $DifferenceObject) }
        } else {
            $ReferenceObject | where-object { -not ($_ -in  $DifferenceObject) }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
