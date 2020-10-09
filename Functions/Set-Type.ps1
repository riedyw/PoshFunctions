# Source https://mjolinor.wordpress.com/2011/05/01/typecasting-imported-csv-data/

Filter Set-Type {
<#
.SYNOPSIS
    Sets the data type of a property given the property name and the data type.
.DESCRIPTION
    Sets the data type of a property given the property name and the data type.
    This is needed as cmdlets such as Import-CSV pulls everything in as a string
    datatype so you can't sort numerically or date wise.
.PARAMETER TypeHash
    A hashtable of property names and their associated datatype
.NOTES
    Only works properly if there are no separate begin, process, and end blocks
.EXAMPLE
    $csv = Import-CSV -Path .\test.csv | Set-Type -TypeHash @{ 'LastWriteTime' = 'DateTime'}
.LINK
    about_Properties
#>

    param(
        [hashtable] $TypeHash
    )

        foreach ($key in $($TypeHash.keys)) {
            $_.$key = $($_.$key -as $TypeHash[$key])
        }
        $_

}
