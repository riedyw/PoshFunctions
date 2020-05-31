Function Compare-ObjectProperty {
<#
.SYNOPSIS
    Compares two objects property by property.
.DESCRIPTION
    Compares two objects property by property. when a simple Compare-Object does not find equivalence, for instance when the order of properties is different between the 2 objects.
.PARAMETER ReferenceObject
    The first object to compare
.PARAMETER DifferenceObject
    The second object to compare
.NOTES
    Author:     Bill Riedy
.EXAMPLE
    Compare-ObjectProperty -ReferenceObject $object1 -DifferenceObject $object2
.OUTPUTS
    [psobject]
.LINK
    Compare-Object
#>

    #region Parameters
    [CmdletBinding(ConfirmImpact='None')]
    [outputtype('psobject')]
    Param(
        [Parameter(Mandatory, HelpMessage = 'First object to compare', Position = 0)]
        [PSObject] $ReferenceObject,

        [Parameter(Mandatory, HelpMessage = 'Second object to compare', Position = 1)]
        [PSObject] $DifferenceObject
    )
    #endregion Parameters

    begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    process {
        $objprops = $ReferenceObject | Get-Member -MemberType Property, NoteProperty | ForEach-Object Name
        $objprops += $DifferenceObject | Get-Member -MemberType Property, NoteProperty | ForEach-Object Name
        $objprops = $objprops | Sort-Object | Select-Object -Unique
        $diffs = @()
        foreach ($objprop in $objprops) {
            $diff = Compare-Object -ReferenceObject $ReferenceObject -DifferenceObject $DifferenceObject -Property $objprop
            if ($diff) {
                $diffprops = @{
                    PropertyName = $objprop
                    RefValue     = ($diff | Where-Object { $_.SideIndicator -eq '<=' } | ForEach-Object $($objprop))
                    DiffValue    = ($diff | Where-Object { $_.SideIndicator -eq '=>' } | ForEach-Object $($objprop))
                }
                $diffs += New-Object -TypeName PSObject -Property $diffprops
            }
        }
        if ($diffs) { return ($diffs | Select-Object -Property PropertyName, RefValue, DiffValue) }
    }

    end {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

}
