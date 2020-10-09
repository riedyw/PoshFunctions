# Source: https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/turning-objects-into-hash-tables-2

function Convert-ObjectToHashtable {
<#
.SYNOPSIS
    Takes a single object and converts its properties and values into a hashtable.

.DESCRIPTION
    Add a more complete description of what the function does.

.PARAMETER object
    Describe parameter -object.

.PARAMETER ExcludeEmpty
    Describe parameter -ExcludeEmpty.

.EXAMPLE
    Convert-ObjectToHashtable -object Value -ExcludeEmpty
    Describe what this call does

.NOTES
    Place additional notes here.

.LINK
    URLs to related sites
    The first link is opened by Get-Help -Online Convert-ObjectToHashtable

.INPUTS
    List of input types that are accepted by this function.

.OUTPUTS
    List of output types produced by this function.
#>

    #region parameter
    [CmdletBinding(ConfirmImpact='None')]
    param
    (
        [Parameter(Mandatory,ValueFromPipeline)]
        $object,

        [Switch]
        $ExcludeEmpty
    )
    #endregion parameter

    process
    {
        $object.PSObject.Properties |
        # sort property names
        Sort-Object -Property Name |
        # exclude empty properties if requested
        Where-Object { $ExcludeEmpty.IsPresent -eq $false -or $_.Value -ne $null } |
            ForEach-Object {
                $hashtable = [Ordered]@{}} {
                $hashtable[$_.Name] = $_.Value
                } {
                $hashtable
                }
    }
}
