function Convert-ObjectToHashtable {
<#
.SYNOPSIS
    Takes a single object and converts its properties and values into a hashtable.
.DESCRIPTION
    Takes a single object and converts its properties and values into a hashtable.
.PARAMETER Object
    The Object to turn into a hashtable
.PARAMETER ExcludeEmpty
    Switch to exclude empty properties
.EXAMPLE
    Convert-ObjectToHashtable -object Value -ExcludeEmpty
.NOTES
    Source: https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/turning-objects-into-hash-tables-2

# todo - need better example
#>

    #region parameter
    [CmdletBinding(ConfirmImpact='Low')]
    [OutputType([hashtable[]])]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter','')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments','')]
    param
    (
        [Parameter(Mandatory,ValueFromPipeline)]
        [psobject] $object,

        [Switch]
        $ExcludeEmpty
    )
    #endregion parameter

    process {
        $object.PSObject.Properties |
        # sort property names
        Sort-Object -Property Name |
            # exclude empty properties if requested
            Where-Object { ($ExcludeEmpty.IsPresent -eq $false) -or ($null -ne $_.Value) } |
                ForEach-Object -begin {
                    $hashtable = ([Ordered]@{}) } -process {
                    $hashtable[$_.Name] = $_.Value
                } -end {
                    Write-Output -InputObject $hashtable
                }
    }
}
