# from: http://community.idera.com/powershell/powertips/b/tips/posts/listing-properties-with-values-part-3

function Remove-EmptyProperty  {
<#
.SYNOPSIS
    To take an object and return only non-empty properties
.DESCRIPTION
    To take an object and return only non-empty properties
.PARAMETER InputObject
    The object that you want empty properties to be removed. Value from pipeline.
.PARAMETER AsHashTable
    To return a hashtable as opposed to another object
.EXAMPLE
    $A = New-Object -TypeName 'psobject' -Property ([Ordered] @{
        Name          = 'test'
        EmptyProperty = $null
    })
    $A

    Name EmptyProperty
    ---- -------------
    test

    Remove-EmptyProperty -InputObject $A

    Name
    ----
    test
.EXAMPLE
    Remove-EmptyProperty -InputObject $A -AsHashTable

    Name                           Value
    ----                           -----
    Name                           test
#>

    [CmdletBinding(ConfirmImpact='Low')]
    param (
        [Parameter(Mandatory,Position=0,ValueFromPipeline)]
            $InputObject,

            [Switch]
            $AsHashTable
    )

    begin {
        $props = @()
    }

    process {
        if ($props.Count -eq 0) {
            $props = $InputObject |
                Get-Member -MemberType *Property |
                Select-Object -ExpandProperty Name |
                Sort-Object
        }

        $notEmpty = $props | Where-Object {
            -not (($null -eq $InputObject.$_ ) -or
            ($InputObject.$_ -eq '') -or
            ($InputObject.$_.Count -eq 0)) |
                Sort-Object

        }

        if ($AsHashTable) {
          $notEmpty |
            ForEach-Object {
                $h = [Ordered]@{}} {
                    $h.$_ = $InputObject.$_
                    } {
                    $h
                    }
        } else {
            $InputObject | Select-Object -Property $notEmpty
        }
    }
}
