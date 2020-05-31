# inspired by: https://stackoverflow.com/questions/3281999/format-list-sort-properties-by-name
# changed logic slighly to handle properties that are currently set to $null
# added [cmdletbinding()] and write-verbose statements
# fixed issue calculating longestValue as the number was negative and comparison should have been -lt
# changed write-host statements to write-output

function Format-SortedList {
    [cmdletbinding()]
    param (
        [Parameter(ValueFromPipeline)]
        [Object] $InputObject,

        [Switch] $Descending
    )

    process {
        $properties = $InputObject | Get-Member -MemberType Properties
        Write-Verbose "Properties are [$($properties.name -join ', ')]"

        if ($Descending) {
            $properties = $properties | Sort-Object -Property Name -Descending
        }

        $longestName = 0
        $longestValue = 0

        $properties | ForEach-Object {
            if ($_.Name.Length -gt $longestName) {
                $longestName = $_.Name.Length
            }

            if (($InputObject."$($_.Name)".Length * -1) -lt $longestValue) {
                $longestValue = $InputObject."$($_.Name)".Length * -1
            }
        }
        Write-Verbose "Longest name is [$LongestName], Longest value is [$longestValue]"

        $properties | ForEach-Object {
            if ( ($null -eq $InputObject."$($_.Name)") -or ('' -eq $InputObject."$($_.Name)")  ) {
                Write-Output ("{0,$longestName} : {1,$longestValue}" -f $_.Name, '')
            } else {
                Write-Output ("{0,$longestName} : {1,$longestValue}" -f $_.Name, $InputObject."$($_.Name)".ToString())
            }
        }
    }
}
