function Merge-Object ([String[]]$Property = @()) {
<#
.SYNOPSIS
    Returns a 'clean' array of objects that have all property names in each element of the array
.DESCRIPTION
    Returns a 'clean' array of objects that have all property names in each element of the array.
    Function aliased to 'Union-Object'
.NOTES
    Inspired by Union-Object on https://powersnippets.com/union-object/

    Notes from the web page:
    Union-Object
    Most native PowerShell cmdlets that handle an array of objects (like e.g. Export-CSV) only look to the first object
    to define the concerned properties. This behavior can lead to unexpected results. Consider the following object:

    $List = @(
        New-Object -TypeName PSObject -Property @{Id = 2}
        New-Object -TypeName PSObject -Property @{Id = 1}
        New-Object -TypeName PSObject -Property @{Id = 3; Name = "Test"}
    )

    If you simply display this object array, only the Id property will be listed:

    PS C:\> $List

    Id
    --
     2
     1
     3
    You might quickly fix this by aligning the properties of the first object with the rest of the objects (Name = $Null):

    $List = @(
        New-Object -TypeName PSObject -Property @{Id = 2; Name = $Null}
        New-Object -TypeName PSObject -Property @{Id = 1}
        New-Object -TypeName PSObject -Property @{Id = 3; Name = "Test"}
    )
    This will work for most of the cases:

    PS C:\> $List

    Id Name
    -- ----
     2
     1
     3 Test
    But not in every case:

    PS C:\> $List | Sort Id

    Id
    --
     1
     2
     3
    In other words, it is required to align every object in the array to prevent that you lose any properties. The
    quickest way is to use the Select-Object cmdlet: Select-Object Id, Name, knowing that just selecting all objects:
    Select-Object *, doesn't resolve the issue. This mean that it is still required to iterate through all the objects
    to define all the properties.

    Fixed array example:
    $List = @(
        New-Object -TypeName PSObject -Property @{Id = 2}
        New-Object -TypeName PSObject -Property @{Id = 1}
        New-Object -TypeName PSObject -Property @{Id = 3; Name = "Test"}
    )

    $NewList = $List | Merge-Object

    $NewList

    Id Name
    -- ----
     2
     1
     3 Test

    Needs to use inline parameters as it doesn't function properly with a param() block
    Made following changes
    * added help
    * formatting changes
#>

    # todo Change += to System.Collections.Arraylist

    [cmdletbinding()]
    [alias('Union-Object')] #FunctionAlias

    $Objects = $Input | ForEach-Object {$_}
    if (-not $Property) {
        foreach ($Object in $Objects) {
            $Property += $Object.PSObject.Properties | Select-Object -ExpandProperty Name
        }
    }
    $Objects | Select-Object -Property ([String[]]($Property | Select-Object -Unique))
}
