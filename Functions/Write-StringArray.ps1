function Write-StringArray {
<#
.SYNOPSIS
    Takes [string] or [string[]] input and writes the code that would create a string array with that information.
.DESCRIPTION
    Takes [string] or [string[]] input and writes the code that would create a string array with that information. Encloses strings in single quotes replacing any existing single quotes with 2 x single quotes.
.PARAMETER Text
    The text to be included in the string array
.PARAMETER VariableName
    The name of the string array variable
.PARAMETER ExcludeDollarSign
    Switch to exclude the dollar sign in front of the variable name. Useful when trying to create string array for *.psd1 files
.EXAMPLE
    Write-StringArray -Text Hello,World,"it's me"

    Would return
    $StringArray = @(
        'Hello',
        'World',
        'it''s me'
    )
.EXAMPLE
    1,2,99 | Write-StringArray -VariableName MyVariable

    Would return
    $MyVariable = @(
        '1',
        '2',
        '99'
    )
.EXAMPLE
    1,2,99 | Write-StringArray -VariableName MyVariable -ExcludeDollarSign

    Would return
    MyVariable = @(
        '1',
        '2',
        '99'
    )
.OUTPUTS
    [string[]]
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact='None')]
    [OutputType('string')]
    Param(
        [Parameter(Mandatory,HelpMessage = 'Enter a series of values',Position = 0,ValueFromPipeline)]
        [string[]] $Text,

        [string] $VariableName = 'StringArray',

        [switch] $ExcludeDollarSign
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        if ($ExcludeDollarSign) {
            $ReturnVal = "$VariableName = @(`n"
        } else {
            $ReturnVal = "`$$VariableName = @(`n"
        }
    }

    process {
        foreach ($CurLine in $Text) {
            $ReturnVal += "    `'$($CurLine -replace "`'", "`'`'")',`n"
        }
    }

    end {
        $ReturnVal = $ReturnVal -replace ",`n$", "`n"
        $ReturnVal += ')'
        Write-Output -InputObject $ReturnVal
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
