function Compare-ObjectProperty {
<#
.SYNOPSIS
    Compares two objects property by property.
.DESCRIPTION
    Compares two objects property by property. A simple Compare-Object only compares those properties with the same name in the two objects.
.PARAMETER ReferenceObject
    The first object to compare
.PARAMETER DifferenceObject
    The second object to compare
.EXAMPLE
    $a = New-Object psobject -Prop ([ordered] @{ One = 1; Two = 2})
    $b = New-Object psobject -Prop ([ordered] @{ One = 1; Two = 2; Three = 3})

    Compare-Object $a $b

    # would return $null because it only compares the properties that have common names but

    Compare-ObjectProperty $a $b

    # would return below because it compares the two objects property by property

    PropertyName RefValue DiffValue
    ------------ -------- ---------
    Three                         3
.OUTPUTS
    [psobject]
.LINK
    Compare-Object
#>

    #region Parameters
    [CmdletBinding(ConfirmImpact = 'None')]
    [OutputType('psobject')]
    Param(
        [Parameter(Mandatory, HelpMessage = 'First object to compare', Position = 0)]
        [PSObject] $ReferenceObject,

        [Parameter(Mandatory, HelpMessage = 'Second object to compare', Position = 1)]
        [PSObject] $DifferenceObject
    )
    #endregion Parameters

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $objprops = New-Object -TypeName System.Collections.ArrayList
    }

    process {
        $null = $objprops.AddRange(($ReferenceObject | Get-Member -MemberType Property, NoteProperty).Name)
        $null = $objprops.AddRange(($DifferenceObject | Get-Member -MemberType Property, NoteProperty).Name)
        $objprops = $objprops | Sort-Object | Select-Object -Unique
        $diffs = New-Object -TypeName System.Collections.ArrayList
        foreach ($objprop in $objprops) {
            $diff = Compare-Object -ReferenceObject $ReferenceObject -DifferenceObject $DifferenceObject -Property $objprop
            if ($diff) {
                $diffprops = @{
                    PropertyName = $objprop
                    RefValue     = ($diff | Where-Object { $_.SideIndicator -eq '<=' } | ForEach-Object $($objprop))
                    DiffValue    = ($diff | Where-Object { $_.SideIndicator -eq '=>' } | ForEach-Object $($objprop))
                }
                $null = $diffs.Add((New-Object -TypeName PSObject -Property $diffprops))
            }
        }
        if ($diffs) {
            $diffs | Select-Object -Property PropertyName, RefValue, DiffValue
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
