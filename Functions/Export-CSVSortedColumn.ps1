function Export-CSVSortedColumn {
<#
.SYNOPSIS
    Sorts the column names alphabetically and exports to csv
.DESCRIPTION
    Sorts the column names alphabetically and exports to csv
.PARAMETER InputObject
    The object that will be exported
.PARAMETER Descending
    Switch if you want the columns to be in reverse alphabetical order.
.PARAMETER Append
    Optional parameter matches parameter in Export-CSV
.PARAMETER Confirm
    Optional parameter matches parameter in Export-CSV
.PARAMETER Delimiter
    Optional parameter matches parameter in Export-CSV
.PARAMETER Encoding
    Optional parameter matches parameter in Export-CSV
.PARAMETER Force
    Optional parameter matches parameter in Export-CSV
.PARAMETER LiteralPath
    Optional parameter matches parameter in Export-CSV
.PARAMETER NoClobber
    Optional parameter matches parameter in Export-CSV
.PARAMETER NoTypeInformation
    Optional parameter matches parameter in Export-CSV
.PARAMETER Path
    Optional parameter matches parameter in Export-CSV
.PARAMETER UseCulture
    Optional parameter matches parameter in Export-CSV
.NOTES
    Inspired by https://stackoverflow.com/questions/3281999/format-list-sort-properties-by-name

    Made following changes
    * added all parameters from Export-CSV
.LINK
    Export-CSV
#>

    [cmdletbinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSupportsShouldProcess', '')]
    param (
        [Parameter(ValueFromPipeline = $true)]
        [Object[]] $InputObject,

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
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
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
            Write-Error -Message 'ERROR Path or LiteralPath not specified.'
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
        $Result | Select-Object -Property $Properties.name | Export-Csv @CsvParams
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
