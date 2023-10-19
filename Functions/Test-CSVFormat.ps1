function Test-CSVFormat {
<#
.SYNOPSIS
    Verifies the format of CSV file and that each row has the same number of fields as the header row
.DESCRIPTION
    Verifies the format of CSV file and that each row has the same number of fields as the header row
.EXAMPLE
    Test-IsAdmin

    Would return the following if the prompt was elevated.
    $True
.EXAMPLE
    Test-IsAdmin -Verbose

    Would return the following if the prompt was elevated.
    VERBOSE: You have Administrator rights.
    True
.NOTES
    #source https://blogs.technet.microsoft.com/heyscriptingguy/2015/07/29/use-function-to-determine-elevation-of-powershell-console/
    # inspired by above, made some minor modifications like proving more output, making it an advanced function.
#>
    [CmdletBinding()]
    [OutputType([bool])]
    param(
        [Parameter(Mandatory)]
        [string] $Path,

        [string] $Delimiter = ','
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        $csv = Import-Csv -Path $Path -Delimiter $Delimiter
        $header = $csv | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name
        foreach ($row in $csv) {
            $fieldCount = ($row | Get-Member -MemberType NoteProperty).Count
            if ($fieldCount -ne $header.Count) {
                Write-Warning -Message "Row $($csv.IndexOf($row)) does not have the same number of fields as the header"
                return $false
            }
        }
        return $true
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
