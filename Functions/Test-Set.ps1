function Test-Set {
    <#
.SYNOPSIS
    Compares 2 arrays of strings and determines if they are EQUAL, SUBSET, SUPERSET, or UNEQUAL
.DESCRIPTION
    Compares 2 arrays of strings and determines if they are EQUAL, SUBSET, SUPERSET, or UNEQUAL. Optionally case sensitive
.PARAMETER ReferenceObject
    The array that is the baseline. Aliased to 'RO', 'Left'
.PARAMETER DifferenceObject
    The array that is being compared to the baseline set. Aliased to 'DO', 'Right'
.PARAMETER CaseSensitive
    Switch indicating that a case sensitive comparison should be made. Aliased to 'CS'
.EXAMPLE
    Test-Set -ReferenceObject a,b,c -DifferenceObject a,c -CaseSensitive
    Subset
.EXAMPLE
    Test-Set -ReferenceObject a,b,c -DifferenceObject a,b,C -CaseSensitive
    NotEqual
.EXAMPLE
    Test-Set -ReferenceObject a,b,c -DifferenceObject a,b,c,D
    SuperSet
.EXAMPLE
    Test-Set -ReferenceObject a,b,c -DifferenceObject a,b,C
    Equal
#>

    [CmdletBinding()]
    [OutputType('string')]
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
            [string[]] $In = $DifferenceObject | where-Object { $_ -cin $ReferenceObject }
            [string[]] $NotIn = $DifferenceObject | where-Object { $_ -cnotin $ReferenceObject }
        } else {
            [string[]] $In = $DifferenceObject | where-Object { $_ -in $ReferenceObject }
            [string[]] $NotIn = $DifferenceObject | where-Object { $_ -notin $ReferenceObject }
        }
        if ($In.count -eq $ReferenceObject.count) {
            if ($NotIn.count -eq 0) {
                Write-Output -InputObject 'Equal'
            } else {
                Write-Output -InputObject 'SuperSet'
            }
        } elseif ($In.count -lt $ReferenceObject.count) {
            if ($NotIn.count -eq 0) {
                Write-Output -InputObject 'Subset'
            } else {
                Write-Output -InputObject 'NotEqual'
            }
        } else {
            Write-Output -InputObject 'NotEqual'
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
