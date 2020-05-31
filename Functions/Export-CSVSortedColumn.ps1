# source: https://stackoverflow.com/questions/3281999/format-list-sort-properties-by-name

function Export-CSVSortedColumn {
    param (
        [Parameter(ValueFromPipeline = $true)]
        [Object[]] $InputObject,

        [Parameter(Mandatory = $false)]
        [Switch] $Descending,

        [Switch] $Append,

        [Switch] $Confirm,

        [char] $Delimiter = ',',

        [string] $Encoding,

        [Switch] $Force,

        [string] $LiteralPath,

        [switch] $NoClobber,

        [switch] $NoTypeInformation,

        [string] $Path,

        [switch] $UseCulture

    )

    begin {
        $Result = ( [System.Collections.ArrayList] @() )
    }

    process {

        $properties = $InputObject | Get-Member -MemberType Properties

        if ($Descending) {
            $properties = $properties | Sort-Object -Property Name -Descending
        }

        $CsvParams = @{}

        if ($LiteralPath) {
            $CsvParams.LiteralPath = $LiteralPath
        } elseif ($Path) {
            $CsvParams.Path = $Path
        } else {
            Write-Error -Message "ERROR Path or LiteralPath not specified."
        }

        if ($UseCulture) {
            $CsvParams.Delimiter = (Get-Culture).TextInfo.ListSeparator
        } else {
            $CsvParams.Delimiter = $Delimiter
        }

        if ($NoTypeInformation) {
            $CsvParams.NoTypeInformation = $true
        } else {
            $CsvParams.NoTypeInformation = $false
        }

        if ($Append) {
            $CsvParams.Append = $true
        } else {
            $CsvParams.Append = $false
        }

        if ($Confirm) {
            $CsvParams.Confirm = $true
        } else {
            $CsvParams.Confirm = $false
        }

        if ($NoClobber) {
            $CsvParams.NoClobber = $true
        } else {
            $CsvParams.NoClobber = $false
        }

        if ($Encoding) {
            $CsvParams.Encoding = $Encoding
        }

        foreach ($CurrentInputObject in $InputObject) {
            [void] $Result.Add($CurrentInputObject)
        }

        # $properties | ForEach-Object {
        #     Write-Host ("{0,$longestName} : {1,$longestValue}" -f $_.Name, $InputObject."$($_.Name)".ToString())
        # }
    }

    end {
        $Result | select $Properties.name | export-csv @CsvParams
    }
}
