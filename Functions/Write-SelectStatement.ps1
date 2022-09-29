function Write-SelectStatement {

    <#
.SYNOPSIS
    From a single object with named properties it will write out a select statement that will join array elements.
.DESCRIPTION
    From a single object with named properties it will write out a select statement that will join array elements.
    Helpful when attempt to export a complex object to a CSV.
    Can optionally enclose the array in different wrapper characters.
    Can optionally specify the delimiter between elements in the array.
.PARAMETER InputObject
    The object that you wish to write the select-object statement against
.PARAMETER Wrapper
    A string parameter with one of these values: ('Braces', 'Brackets', 'Chevrons', 'Parentheses', 'None'). Defaults to 'Brackets'
.PARAMETER Delimiter
    A string parameter used to separate the values within the array. Defaults to ';'
.NOTES
    1 - The object has to have named properties
    2 - The named properties can NOT have embedded spaces
    3 - The function will create a temporary file from New-TemporaryFile and remove it when finished
.EXAMPLE
    Get-ADUser UserID -Properties dSCorePropagationData |
    Select-Object SamAccountName, DistinguishedName, dsCorePropogationData |
    Write-SelectStatement

    Would return
    Select-Object -Property SamAccountName, DistinguishedName, @{N='dsCorePropogationData';E={'[' + ($_.dsCorePropogationData -join ';') + ']'}}

    Because dsCorePropogationData is an array of values
.EXAMPLE
    Get-ADUser UserID -Properties dSCorePropagationData |
    Select-Object SamAccountName, DistinguishedName, dsCorePropogationData |
    Write-SelectStatement -Wrapper Parentheses -Delimiter '|'

    Would return
    Select-Object -Property SamAccountName, DistinguishedName, @{N='dsCorePropogationData';E={'(' + ($_.dsCorePropogationData -join '|') + ')'}}
#>

    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter','')]

    param (
        [Parameter(ValueFromPipeline)]
        [object] $InputObject,

        [ValidateSet('Braces', 'Brackets', 'Chevrons', 'Parentheses', 'None')]
        [string] $Wrapper = 'Brackets',

        [string] $Delimiter = ';'
    )

    begin {
        switch ($Wrapper) {
            'Braces' {
                $Open = "'{' + "
                $Close = " + '}'"
            }
            'Brackets' {
                $Open = "'[' + "
                $Close = " + ']'"
            }
            'Chevrons' {
                $Open = "'<' + "
                $Close = " + '>'"
            }
            'Parentheses' {
                $Open = "'(' + "
                $Close = " + ')'"
            }
            'None' {
                $Open = ''
                $Close = ''
            }

        }
        $Before = 'Select-Object -Property '
        $Result = New-Object -TypeName System.Collections.ArrayList
    }

    process {
        $TempFile = New-TemporaryFile
        # write-output $TempFile
        ($InputObject | Select-Object -First 1 | Format-List -Property * | Out-String ) -split '\r?\n' | Remove-BlankOrComment > $TempFile
        Get-Content -Path $TempFile | ForEach-Object -Process {
            $Token = $_ -split ' : '
            if ($Token.Count -eq 2) {
                if ($Token[1] -match '^{.*}$') {
                    $null = $Result.Add("@{N='$($Token[0].Trim())';E={$Open(`$_.$($Token[0].Trim()) -join '$Delimiter')$Close}}")
                } else {
                    $null = $Result.Add("$($Token[0].Trim())")
                }
            } else {
                $null = $Result.Add("$($Token[0].Trim())")
            }
        }
    }

    end {
        $Output = $Before + $($Result -join ', ')
        Write-Output -InputObject $Output
        Remove-Item -Path $TempFile
    }
}
