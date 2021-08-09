function Compare-ObjectSetIntersection {
    <#
.SYNOPSIS
    Compares 2 arrays of strings and returns The SET INTERSECTION of the arrays
.DESCRIPTION
    Compares 2 arrays of strings and returns The SET INTERSECTION of the arrays. Optionally case sensitive.
.PARAMETER ReferenceObject
    The array that is the baseline. Aliased to 'RO', 'Left'
.PARAMETER DifferenceObject
    The array that is being compared to the baseline set. Aliased to 'DO', 'Right'
.PARAMETER CaseSensitive
    Switch indicating that a case sensitive comparison should be made. Aliased to 'CS'
.EXAMPLE
    Compare-ObjectSetIntersection -ReferenceObject a,b,c -DifferenceObject a,c -CaseSensitive
    a
    c
.EXAMPLE
    Compare-ObjectSetIntersection -ReferenceObject a,b,c -DifferenceObject a,b,C -CaseSensitive
    a
    b
.EXAMPLE
    Compare-ObjectSetIntersection -ReferenceObject a,b,c -DifferenceObject a,b,c,D
    a
    b
    c
.EXAMPLE
    Compare-ObjectSetIntersection -ReferenceObject a,b,c -DifferenceObject a,b,C
    a
    b
    c
.NOTES
    Inspired by:
    https://sqljana.wordpress.com/2015/09/23/perform-set-operations-union-intersection-minus-complement-using-powershell/
    http://www.cs.odu.edu/~toida/nerzic/content/set/set_operations.html
    http://www.dummies.com/how-to/content/find-the-union-intersection-relative-complement-an.html
#>

    [CmdletBinding()]
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
            Compare-Object -ReferenceObject $ReferenceObject -DifferenceObject $DifferenceObject -Passthru -IncludeEqual -ExcludeDifferent -CaseSensitive
        } else {
            Compare-Object -ReferenceObject $ReferenceObject -DifferenceObject $DifferenceObject -Passthru -IncludeEqual -ExcludeDifferent
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
